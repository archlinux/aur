# Maintainer: Vladimir Kamensky <mastersoft24@yandex.ru>

pkgname=cloudcross
pkgver=1.4.4
pkgrel=1
pkgdesc="Opensource cross-platform client for multiple cloud providers."
arch=('x86_64')
url="http://cloudcross.mastersoft24.ru"
license=('BSD')
categories=('network')
replaces=('grive2')
depends=( 'qt5-base' 'curl')
source=("$pkgname-$pkgver::https://github.com/MasterSoft24/CloudCross/archive/v$pkgver.tar.gz")
md5sums=('25f5a74391563de6c0f0a376cbab048a')

build() {
	cd CloudCross-$pkgver
	rm -rf build
	mkdir build
	cd build
	qmake .. 
	make   
}
 
package() {
	cd CloudCross-$pkgver/build
	install -Dm755 ccross-app/ccross "$pkgdir/usr/bin/ccross"
	install -m755  ccross-curl-executor/ccross-curl "$pkgdir/usr/bin"
	install -Dm644 ../ccross-app/doc/ccross "$pkgdir/usr/share/man/man1/ccross.1"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
