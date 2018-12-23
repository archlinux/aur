# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.3.2
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
  '263b0c9b0fc02f33e3c994992be6cb9b7f9debd8156838aca842ed8c3a9e28bd6a1de4c961d7263338e51570cda272dae0804cd1d2119825b2fc252345956c0d'
  '599fe685bfe4b9c0995950fae1ff9b700e31d89537aea46cc6e4f020711c4009f7b538c730a25bcf3d51c1c0817802ea1c1d744fb849b789447c81696f689fd6'
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

