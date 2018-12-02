# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.3.0
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
  '0c0502d2352de9bc2b6ab070163b5c8e9f94ab26896809562ef95d80b45d116aa09257d9b1ec8e0c601bd1cad53d4ac50c10f5a65a63c777dea6b91e61853788'
  '11fc44bfbe563cabf30556b995159e9b7750787f0f0081f26cce651c8bf22460a0dbc89590e69712a4955339f655eea5e75e86d3ce7029f70600ee4916ac7b3b'
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

