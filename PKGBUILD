# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sassc-git
pkgver=3.6.2.r0.g66f0ef3
pkgrel=1
pkgdesc="Libsass command line driver"
arch=('i686' 'x86_64')
url="https://github.com/sass/sassc"
license=('MIT')
depends=('glibc' 'libsass')
makedepends=('git')
provides=("sassc=$pkgver")
conflicts=('sassc')
source=("git+https://github.com/sass/sassc.git")
sha256sums=('SKIP')


pkgver() {
  cd "sassc"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "sassc"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "sassc"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sassc"
}
