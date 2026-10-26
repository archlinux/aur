# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sonic-frameworks-syntax-highlighting
pkgver=6.31.0
pkgrel=1
pkgdesc='Syntax highlighting engine for structured text and code'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-syntax-highlighting'
license=('MIT')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('syntax-highlighting')
conflicts=('syntax-highlighting')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7f4fae2e60d203de1fd24a77c709073bad2407aa7c198154a263c6caea6fcd91')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DQRC_SYNTAX=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/LICENSES/MIT.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
