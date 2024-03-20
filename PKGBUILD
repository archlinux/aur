# Maintainer: Sven Yannick Klein <syk42 dot arch at gmail dot com>
pkgname=logoutscreen
gitname=LogoutScreen
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple window across the whole screen to reboot, shutdown, lock, logout'
arch=('x86_64')
url='https://gitlab.com/syk42.arch/LogoutScreen.git'
license=('GPL3')
depends=('qt5-base')
source=("https://gitlab.com/syk42.arch/$gitname/-/archive/$pkgver/$gitname-$pkgver.tar.gz")
b2sums=('62f4aa8dbfad8bb25bead1ac2e1d9445719bbcee71ce816b57d5e7b7381a8bce5e71da2dfe673b59e938bd5b0d36e27f09c06754a3f3c402e5fe01ec719cd43b')

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
