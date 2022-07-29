# Maintainer: Sven Yannick Klein <syk42 dot arch at gmail dot com>
pkgname=logoutscreen
gitname=LogoutScreen
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple window across the whole screen to reboot, shutdown, lock, logout'
arch=('x86_64')
url='https://gitlab.com/syk42.arch/LogoutScreen.git'
license=('GPL3')
depends=('qt5-base')
source=("https://gitlab.com/syk42.arch/$gitname/-/archive/$pkgver/$gitname-$pkgver.tar.gz")
b2sums=('329aa3323bdb3285231a42d880e7b45793233380e0f1e1724c238edf19f04cb85ce577633a699692f0e846143bf2e4c7a9da235c3e338b14218e5ee7b72fe627')

prepare() {
	cd $srcdir/$gitname-$pkgver
	mkdir -p build
	cd build
	qmake .. PREFIX=$pkgdir/usr/
}

build() {
	cd $srcdir/$gitname-$pkgver
	cd build
	make
}

package() {
	#install the binary
	install -Dm755 "$srcdir/$gitname-$pkgver/build/logout_screen" "$pkgdir/usr/bin/$pkgname"

	#install the license
	install -Dm644 "$srcdir/$gitname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
