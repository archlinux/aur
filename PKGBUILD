# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.1
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
  '7326c5039175dc6f94163f4835c9cc9c9b38d3a1e086f066ae3d58f9e69b13af37bbbe577538715ef3c39fcd3a826be4283d3a7960e4af0337cd1947950de59a'
  '8462776e0d8953d019aa48b6278809c21f021ae4dbb17e57d7ba68ee7e42335996d0fcba9c025cd4003fc89e02a0fddd93c93bbe3301bcf0dea94188e29254c6')

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

