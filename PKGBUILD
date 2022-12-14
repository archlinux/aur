# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.3.2
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'zlib')
makedepends=('pyinstaller')
provides=('zork++')
conflicts=('zork++')
source=(
	"$pkgname-$pkgver-src.zip::https://github.com/zerodaycode/Zork/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=(
	'c47c1384372dfe2107274b77ef42ab3c3c7b51572908716b92d553feec3e157a'
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
