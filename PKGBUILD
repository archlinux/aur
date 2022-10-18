# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=buildcache-git
pkgver=0.27.7.r0.gf324a12
pkgrel=1
pkgdesc="An advanced compiler accelerator"
arch=('i686' 'x86_64')
url="https://github.com/mbitsnbites/buildcache"
license=('zlib')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cmake')
optdepends=('lua')
provides=("buildcache=$pkgver")
conflicts=('buildcache')
source=("git+https://github.com/mbitsnbites/buildcache.git")
sha256sums=('SKIP')


pkgver() {
  cd "buildcache"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "buildcache"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    "src"
  make -C "_build"
}

check() {
  cd "buildcache"

  make -C "_build" test
}

package() {
  cd "buildcache"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/buildcache"
}
