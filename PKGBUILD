# Maintainer: Ludovic Bellier <aur at zyrianes.net>
pkgname=gitid
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple, minimal command line tool allowing for management of git identities."
arch=('x86_64')
url="https://github.com/Luiserebii/gitid"
license=('GPL3')
depends=('git>=2.7.6')
makedepends=('autoconf' 'make' 'gcc')
source=("https://github.com/Luiserebii/gitid/archive/v$pkgver.tar.gz")
md5sums=('569c66c489d78256b3ad8c82a29af561')

build() {
	cd "$pkgname-$pkgver"
        make autogen
        ./configure --prefix=/usr
        make
}

check() {
	cd "$pkgname-$pkgver"/test
	make
        ./a.out
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
        install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
