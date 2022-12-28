# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.4.1
pkgrel=2
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'zlib')
makedepends=('pyinstaller')
checkdepends=('python-pytest')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver-src.zip::https://github.com/zerodaycode/Zork/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=(
	'9cd1a516f593ff7e5d52df7903c516e498d2e07b9fe2556f9605ac66e681027b'
)

build() {
	pushd "${srcdir}/Zork-${pkgver}"
	pyinstaller ./zork/zork++.py --onefile
	popd
}

check() {
	pushd "${srcdir}/Zork-${pkgver}"
	python -m pytest
	popd
}

package() {
	install -Dm644 "${srcdir}/Zork-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/Zork-${pkgver}/dist/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
