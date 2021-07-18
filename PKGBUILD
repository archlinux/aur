# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.3
pkgrel=1
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19' 'make' 'bash')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('db1c7ac70d41014a34ac156eb073db0589928aabfb872455ee84e660f89a0d79623c1eaa4cde77d29bc97fb3b5ba42ef704be271a3fcae639429fa7718f7203c')

build() {
	cd "$pkgname-$pkgver"
	local generator=$(\
		pacman -Qq ninja 1>/dev/null 2>/dev/null \
		&& echo 'Ninja' \
		|| echo 'GNU Makefiles' )

	installpath="$pkgdir/usr" ./build.sh Release
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
