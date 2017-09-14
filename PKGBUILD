# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tslib-git
pkgver=1.13.r0.g50196cb
pkgrel=1
pkgdesc="C library for filtering touchscreen events"
arch=('i686' 'x86_64')
url="http://www.tslib.org/"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('tslib')
conflicts=('tslib')
source=("git+https://github.com/kergoth/tslib.git")
sha256sums=('SKIP')


pkgver() {
  cd "tslib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "tslib"

  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc"
  make
}

package() {
  cd "tslib"

  make DESTDIR="$pkgdir" install
}
