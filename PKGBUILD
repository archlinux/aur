# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
_pkgver=1.02
pkgver="$_pkgver"BETA
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
#to build without yubikey support, remove yubikey-personalization and uncomment NO_YUBI in build()
depends=('libxtst' 'wxgtk' 'webkitgtk2' 'yubikey-personalization' 'xerces-c')
makedepends=('zip' 'libxt' 'git' 'cmake')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'passwordsafe-git' 'pwsafe' 'pwsafe-gui')
source=(https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig)
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')  # http://pgp.mit.edu/pks/lookup?op=vindex&search=0xB131423D7F2F1BB9
sha1sums=('e2e4b31684b0eee39953cf8abbe88262932e09a8'
          'SKIP')

build() {
	cd $_pkgname-$pkgver
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$_pkgname-$pkgver"
	cd build
	DESTDIR="$pkgdir" make install
}
