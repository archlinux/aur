# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jitterentropy-git
pkgver=3.3.0.r0.g418c1e6
pkgrel=1
pkgdesc="Library for hardware RNG based on CPU timing jitter"
arch=('i686' 'x86_64')
url="https://www.chronox.de/jent.html"
license=('BSD' 'GPL')
depends=('glibc')
makedepends=('git')
provides=('jitterentropy')
conflicts=('jitterentropy')
options=('staticlibs')
source=("git+https://github.com/smuellerDD/jitterentropy-library.git")
sha256sums=('SKIP')


pkgver() {
  cd "jitterentropy-library"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jitterentropy-library"

  make
}

package() {
  cd "jitterentropy-library"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    install \
    install-static
  chmod 644 "$pkgdir/usr/lib"/*.a
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/jitterentropy"
}
