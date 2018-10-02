# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.2.0
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
  '5c07ad25cf977503b6170eb56faadb4560c519cb462789dd9ee2e5fa658f30b2c6f431c4b91de0a1a9b82a9a6d293d96310d4ddc2025d7ea8b73a3357e6b8ded'
  '51a65382ffb97c5372de14c1dab85305ff5816a9dbe13d3420ccf1ed66576475fb4641a7a54cd7465e808f2f28ecc29d5fecfad77134b4cc1832435ebf4f824b')
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

