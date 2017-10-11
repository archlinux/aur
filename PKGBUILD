# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
_pkgver=1.03
pkgver="$_pkgver"BETA
pkgrel=2
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
depends=('libxtst' 'wxgtk' 'yubikey-personalization' 'xerces-c' 'qrencode')
makedepends=('zip' 'libxt' 'cmake' 'gtest')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'passwordsafe-git' 'pwsafe' 'pwsafe-gui')
source=(https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig)
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')  # http://pgp.mit.edu/pks/lookup?op=vindex&search=0xB131423D7F2F1BB9
sha1sums=('23ff4dad38e3bfcabb71b3801ceb316e187bd89a'
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
