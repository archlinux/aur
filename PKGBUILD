# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=kvirtual
pkgver=1.1.1
_commithash='c44469b'
_developer='didier13150'
pkgrel=2
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kdebase-runtime' 'qemu')
makedepends=('cmake' 'automoc4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_developer/$pkgname/tarball/$_commithash")
sha256sums=('b4c9b11add2a8174cd13ed7c5349551d0afdd1ded5a339f4310c49467bfed5ad')

_srcfolder=$_developer-$pkgname-$_commithash

prepare() {
	mv "$_srcfolder" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}
package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}

