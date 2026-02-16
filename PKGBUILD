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
sha256sums=("eb3dcdf74586b283221f6b4fe63bad0d6238387cde224e6647e0f096f063e4b2")

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
