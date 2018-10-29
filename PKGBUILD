# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.2.3
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
  '2fed7e4377be1c787445c20fa857ac4d87625bec034dfcdc07f759723959ab48afe928c37835fb64eac343d0157e4dc7793f709635257e03e75d389535c15229'
  'ef15b0a9b213abe695b7f28d471c3a011953a89f2e3134feb0ac82b0151a411f959c91532cfa73167ba6d4d1a7a7b0bb5a13309c2059b413f567f4b77ec7c6d8'
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

