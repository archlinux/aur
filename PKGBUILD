# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=kvirtual
pkgver=1.0.0
_commithash='0e749e3'
_developer='didier13150'
pkgrel=1
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kdebase-runtime' 'qemu')
makedepends=('cmake' 'automoc4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_developer/$pkgname/tarball/$_commithash"
		'0001-kvirtualview-add-unistd.sh-for-gcc-4.7.patch')

_srcfolder=$_developer-$pkgname-$_commithash

build() {
	mv "$_srcfolder" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-kvirtualview-add-unistd.sh-for-gcc-4.7.patch"

	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
	make
}
package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
md5sums=('39ddd199bd44f9819f74972b681f57c8'
		 '5250e0ea2f0a29af3f7d7cf58cdbd629')
