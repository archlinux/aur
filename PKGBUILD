# Maintainer: Marius Hirt <marius-hirt@web.de>
_pkgname=zork++
pkgname=zork++-git
pkgver=0.4.0.r0.g958a500
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
source=("$_pkgname::git+https://github.com/zerodaycode/Zork")
sha256sums=(SKIP)

pkgver() {
        cd "${srcdir}/${_pkgname}"
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	pushd "${srcdir}/${_pkgname}"
	pyinstaller ./zork/zork++.py --onefile
	popd
}

check() {
	pushd "${srcdir}/${_pkgname}"
	python -m pytest
	popd
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/${_pkgname}/dist/zork++" \
		"${pkgdir}/usr/bin/zork++"
}
