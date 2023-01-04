# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.4.2
pkgrel=1
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
	'cc9de2ae16fa053d15b4e7ca80b141593af6117939c98bc4fbdf4ae4e1b46b85'
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
