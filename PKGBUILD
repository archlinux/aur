# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.2.2
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
  '364bff98b2dc515dc2ef315ea2a2718373080a40772f8e4005bf400988a6493f3c166aebdda9cd7eb8ac08a5888e07c1d8a3148a8083076823b388d01ab8b1d4'
  'a2a8bc3f02df00894caa38fb31c132b0c5494818e2dfd03f2c75803173999267269285ba6d82d4ff8ed044ac63a31f88fd42142871e1ca996550d1efca4bc05c')
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

