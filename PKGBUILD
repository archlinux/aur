# Maintainer: Parola Marco <mark.prl.97@gmail.com>
pkgname=xorinator
pkgver=1.2.1
pkgrel=2
pkgdesc="A command line utility for simple one-time pad encryption over multiple keys"
arch=('any')
url="https://github.com/Sonotsugipaa/xorinator"
license=('MIT')
makedepends=('gcc>=11' 'cmake>=3.19' 'make' 'bash')
source=("https://github.com/Sonotsugipaa/xorinator/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3cb1188dd6f272f1f707fe2f27b58596721c6b526174e43d991ad0fbad183821423626c39f43a7f6d8823166024b305f4cd5b645c053826f98df23f75724848e')

# prepare() {
#
# }

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
