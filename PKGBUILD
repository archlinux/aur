# Maintainer: basicallygit <91993321+basicallygit@users.noreply.github.com>
# Issues with this package may be submitted to https://github.com/basicallygit/nacrypt/issues
pkgname=nacrypt
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple & secure file encryption utility"
url="https://github.com/basicallygit/nacrypt"
arch=('x86_64')
license=('Apache-2.0')
depends=('libsodium' 'libseccomp' 'libcap')
makedepends=('clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/basicallygit/nacrypt/archive/$pkgver.tar.gz")
sha256sums=("9ad410e49ccd11e64cfa2cc0b36bd9b69d8b7823c3937f6b8593071fd5c3dd0a")

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	export CC=clang
	export CXX=clang++
	
	cd "$pkgname-$pkgver"
	make CLANG_CFI=y TIGHTENED_SANDBOX=y
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 nacrypt "$pkgdir/usr/bin/nacrypt"
}
