# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.3.2
pkgrel=1
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19' 'make' 'bash')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9a6ffaae7fb181d1f745f410595a93e4984bdde06744e1650337a7e2a57133468832055e0d59b5e025afce61e20c1eee78c0290ee5d3e4eb6a5dd92760a2d0bb')

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
