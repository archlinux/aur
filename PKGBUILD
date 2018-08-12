# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.1.1
pkgrel=1
pkgdesc="A PAM module that protects sensitive data and provides a panic function for emergency situations. Authentication through passwords or removable media."
arch=('any')
url="https://github.com/pampanic/pam_panic"
license=('GPL3')
# depends=('')
makedepends=('git' 'automake' 'autoconf' 'make' 'gcc' 'which' 'groff' 'gettext' 'm4' 'fakeroot' 'gawk' 'pam' 'cryptsetup')
checkdepends=('bcunit-cunit-compat')
validpgpkeys=('E2D7876915312785DC086BFCC1E133BC65A822DD')
source=(
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=(
  '5c2019c584c9663481bbe8d31bcab23d31e75bf70e654ed09eba44ae6ef7ba17915d506b0eb309608bf20856e5825b25af6cd5dce1ebb0db5507ddde2c97ce3e'
  'd2ea70f2ddad12cf842f8974cae7996f0e282be9c174dfb3baa12428b8bc6d7ce8dc726098ce0ddcc1430d35a84d268ff9832f7f4abf86995674c5edf2a4cd99')

build() {
  cd $pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

