# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.3.3
pkgrel=1
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19' 'make' 'bash')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b84f9dcc13125f6715277e368d1766c103421873443cbef4aeccbfde2c0ef1f592b18c4a084dbcc6a571960a65e350c3e04708c0aaf8fe409fe3a7877d28fcad')

build() {
	cd "$pkgname-$pkgver"
	local _generator="$(\
		pacman -Qq ninja 1>/dev/null 2>/dev/null \
		&& echo 'Ninja' \
		|| echo 'Unix Makefiles' )"

	installpath="$pkgdir/usr" generator="$_generator" ./build.sh Release
}

check() {
	cd "$pkgname-$pkgver"
	build-Release/test/run-tests.sh
}

package() {
	cd "$pkgname-$pkgver"
	local license_dir="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$license_dir"
	cp LICENSE "$license_dir/."
	cmake --install build-Release
}
