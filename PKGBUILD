# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
pkgver=1.16.0
pkgrel=1
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
depends=('wxwidgets-gtk3' 'yubikey-personalization' 'xerces-c' 'qrencode' 'file')
makedepends=('zip' 'libxt' 'cmake' 'git')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'pwsafe' 'pwsafe-gui')
source=(passwordsafe-$pkgver.tar.gz::https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	passwordsafe-$pkgver.tar.gz.sig::https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig)
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')  # http://pgp.mit.edu/pks/lookup?op=vindex&search=0xB131423D7F2F1BB9
sha1sums=('6722146e701d5e14b2311c4b0d90eb4aae51d306'
          'SKIP')

build() {
	cd $_pkgname-$pkgver
	mkdir -p build
	cd build
	cmake .. -DNO_GTEST=ON \
		 -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd $_pkgname-$pkgver
	cd build
	DESTDIR="$pkgdir" make install
}
