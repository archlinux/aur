# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Nikita Ukhrenkov <thekit@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=libconic
pkgver=0.24.1
pkgrel=1
pkgdesc="Internet connectivity library"
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(LGPL)
depends=(dbus-glib gconf icd2-osso-ic-headers)
makedepends=(git glib2)
checkdepends=()
groups=(maemo)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  CFLAGS="$CFLAGS -Wno-error=deprecated-declarations" ./configure --prefix=/usr
  make
 }

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  libtool --finish /usr/lib
}
