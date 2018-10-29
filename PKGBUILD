# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.2.5
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
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
sha512sums=(
  'f1a15b3e9a4d3599ba1fd398ce5eaeda0138ebdecb2ca1822b492430391bd0f3dcd976c9dda75d5bb60fd0aaa2120da7aa875e4828f67c14bb0c31e57faf1268'
  'f554356bb98a93e072cceb8f96f8328c0f59ffdc895a20bc6bc0947c2c364bb3ebe1a0e857f56a8d43f3d48f9a4a39327cdfc2183a6b0a528534baebfdea0627'
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

