# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.2.1
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
'ca758c86317ec16d957db5341a4e7f5157c6503bf502e658ec97f3251c62e0463b99264ebd754b1448883fb06b925c1030600ac22c9c3cb1761d647e634f5175'
'c9d44e4e0f84e22a489365652f0fc90c1aabae02112e80582b0aef93df496d6733f2b650c9fbf1590c43f530d523552d0dc145fbdbf54415b49d59ef2ed876da')
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

