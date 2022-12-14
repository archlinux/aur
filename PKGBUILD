# Maintainer: Marius Hirt <marius-hirt@web.de>
pkgname=zork++
pkgver=0.4.0
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
	'f644b24dc60872432e791b7908ac2ab7b2c9010b6a6d4ee4253c7ecf90ae7c66'
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
