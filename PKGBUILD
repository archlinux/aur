# Maintainer: jokersus <jokersus.cava@gmail.com>
_pkgname=f3d
_pkgown=f3d-app
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
epoch=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_pkgown/$_pkgname"
license=('BSD')
provides=('f3d')
conflicts=('f3d')
backup=("etc/$_pkgname/config.json")
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-Linux.tar.xz")
sha256sums=('084e398cad972c673ce46b1ae160a50643fc91789741d696c1f5c7dc73915708')

package() {
	install -Dm755 "${srcdir}/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/lib/lib${_pkgname}.so" -t "${pkgdir}/usr/lib"
	install -Dm644 "${srcdir}/share/${_pkgname}/config.json" -t "${pkgdir}/etc/${_pkgname}"

	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	mv "${srcdir}/share/doc/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	mv "${srcdir}/share/doc/${_pkgname}/THIRD_PARTY_LICENSES.md" -t "${pkgdir}/usr/share/licenses/${_pkgname}"

	install -Dm644 ${srcdir}/include/${_pkgname}/* -t "${pkgdir}/usr/include/${_pkgname}"
	install -Dm644 ${srcdir}/lib/cmake/${_pkgname}/* -t "${pkgdir}/usr/lib/cmake/${_pkgname}"

	cp -r "${srcdir}/share" "${pkgdir}/usr/"
}