# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2019.07.1
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz"
        'permission-check.patch')
sha512sums=('c8ffaf962191a60f643e6e1b765ec700664988ffc629765c273baf32d2748763480f9fd7a2d978b7f99d3ba4bf962775f4dca40053ace2ddd8cd0bffbd977d84'
            'c0b692508632976a8f3d872473346178ae9d416953ab3ca3adf7d333656d5a5234aefecbda5534ebc9c8c832d34587602390f6eb78611f7e55e9adb1e792bebe')

prepare() {
	cd $_pkgname-$pkgver
	patch -p1 < "$srcdir"/permission-check.patch
}

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

