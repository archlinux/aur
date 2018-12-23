# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.3.3
pkgrel=1
pkgdesc="A PAM module that protects sensitive data and provides a panic function for emergency situations. Authentication through passwords or removable media."
arch=('any')
url="https://github.com/pampanic/pam_panic"
license=('GPL3')
depends=('cryptsetup' 'dialog' 'gettext')
makedepends=('git' 'automake' 'autoconf' 'make' 'gcc' 'which' 'groff' 'gettext' 'm4' 'fakeroot' 'gawk' 'pam' 'cryptsetup' 'dialog')
checkdepends=('bcunit-cunit-compat')
validpgpkeys=('E2D7876915312785DC086BFCC1E133BC65A822DD')
source=(
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
sha512sums=(
  'c5c10a3fac413c59b496f23585d54f40c2c30b8d10c63ad7651bf7d13e6161e22824560748b5de25b619d081afc15d374379b65b47834c67152f80a469736edf'
  'd5a830f79c54183c09096f577a267aa1b96138965eef694545535b6b59d8cc7b72336253dd8b44472c734c8858350b1937645b23b46d024afc3905eea77e3a0e'
)

build() {
  cd $pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make test
  make clean
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

