# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fdkaac-git
pkgver=1.0.1.r0.gfdf5c2f
pkgrel=1
pkgdesc="Command line encoder frontend for libfdk-aac"
arch=('i686' 'x86_64')
url="https://github.com/nu774/fdkaac"
license=('custom')
depends=('glibc' 'libfdk-aac')
makedepends=('git')
provides=('fdkaac')
conflicts=('fdkaac')
source=("git+https://github.com/nu774/fdkaac.git")
sha256sums=('SKIP')


pkgver() {
  cd "fdkaac"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "fdkaac"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "fdkaac"

  make check
}

package() {
  cd "fdkaac"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/fdkaac"
}
