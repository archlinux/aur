# Maintainer: éclairevoyant
# Contributor: Nick Black <dankamongmen at gmail dot com>

_gitname=QR-Code-generator
pkgname=qrcodegen
pkgver=1.8.0
pkgrel=1
pkgdesc="High-quality QR Code generator library"
arch=('x86_64')
url="https://www.nayuki.io/page/qr-code-generator-library"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nayuki/$_gitname/archive/v$pkgver.tar.gz")
b2sums=('2e511baf35fbfdb71ad5e2dc91c1400a113eb9bce51afa022c34b7ad7d3c9be4a862e2caaef89f517fbbf29879223fb078c88fdec27d6a876126c798ac6772c6')

build() {
	cd $_gitname-$pkgver
	sed -nE '/Copyright/,$ p' Readme.markdown > LICENSE
	make -C c
}

check() {
	$_gitname-$pkgver/c/$pkgname-test
}

package() {
	cd $_gitname-$pkgver
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	cd c
	install -Dm644 *.a -t "$pkgdir/usr/lib/"
	install -Dm644 *.h -t "$pkgdir/usr/include/qrcodegen/"
	install -Dm755 $pkgname-demo -t "$pkgdir/usr/bin/"
}
