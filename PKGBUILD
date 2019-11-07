# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>

_pkgname=pwsafe
pkgname=passwordsafe
_pkgver=1.08.2
pkgver="$_pkgver"BETA
pkgrel=2
pkgdesc="Simple & Secure Password Management"
arch=('i686' 'x86_64')
url="https://pwsafe.org/"
license=('Artistic2.0')
depends=('libxtst' 'wxgtk2' 'yubikey-personalization' 'xerces-c' 'qrencode')
makedepends=('zip' 'libxt' 'cmake' 'gtest' 'git')
optdepends=('xvkbd: virtual-keyboard support')
conflicts=('passwordsafe-debian' 'pwsafe' 'pwsafe-gui')
source=(https://github.com/pwsafe/pwsafe/archive/$pkgver.tar.gz
	https://github.com/pwsafe/pwsafe/releases/download/$pkgver/$pkgver.tar.gz.sig
	412458d281-glibc2.30-fix.patch)
validpgpkeys=('C8876BE69A8EC6414C8C8729B131423D7F2F1BB9')  # http://pgp.mit.edu/pks/lookup?op=vindex&search=0xB131423D7F2F1BB9
sha1sums=('0643f708517302a715a68241f90072dcb41a0c46'
          'SKIP'
          '6d7c571d9f03f4f56fd60f8756d2db46e0e334b7')

prepare() {
	cd $_pkgname-$pkgver
	patch -p1 < ../412458d281-glibc2.30-fix.patch
}

build() {
	cd $_pkgname-$pkgver
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd $_pkgname-$pkgver
	cd build
	DESTDIR="$pkgdir" make install
}
