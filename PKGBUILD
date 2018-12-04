# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.3.1
pkgrel=2
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
  'df99be788125e1bae915ae8c9c8924999e819bc1752d544dc85e68f84b0c702f06f5fdfc802fa9e9432f3fb7c4ab49361652b51f23066b0a15defe5e4995817a'
  'a0ec122ec8ca051d25e08c6ea8ec1fa773802899ff6f97264e64f20ae0830a1af767d8f360b3cf53e85109a7336bcf01dbf1f6f2515f53af83f68993f98698ba'
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

