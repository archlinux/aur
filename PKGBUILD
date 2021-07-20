# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.3.1
pkgrel=1
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19' 'make' 'bash')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dd39ce7f9f0cb8905cf64570eb3b043df3bb6a13172ee1c46bf44aaf4c5ba7528640eb8f43b6786941ddf0f587add2ff7d4492400c9d6b106c67fd966d9511dc')

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
