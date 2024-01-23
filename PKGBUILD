# Maintainer: jokersus <jokersus.cava@gmail.com>
_pkgname=f3d
_pkgown=f3d-app
pkgname=${_pkgname}-bin
pkgver=2.3.0
pkgrel=1
epoch=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_pkgown/$_pkgname"
license=('BSD')
depends=('libglvnd' 'libxcb' 'libxau' 'libxdmcp')
provides=('f3d')
conflicts=('f3d')
backup=("etc/$_pkgname/config.json")
_pkgsrc=F3D-$pkgver-Linux-$CARCH-raytracing
source=("$url/releases/download/v$pkgver/$_pkgsrc.tar.xz")
sha256sums=('6f2d463fc197bbd27833167d519d90f237f647a3d55a2cde2e39b3c13260f873')

package() {
	install -dm755 "${pkgdir}"/opt/
	install -dm755 "${pkgdir}"/usr/bin/
	install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"

	cp -a "${srcdir}/${_pkgsrc}" "${pkgdir}/opt/${_pkgname}"
	ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "${srcdir}/${_pkgsrc}/lib/lib${_pkgname}.so" -t "${pkgdir}/usr/lib"
	
	mv "${srcdir}/${_pkgsrc}/share/licenses/${_pkgname}" -t "${pkgdir}/usr/share/licenses"
	rm -r "${srcdir}/${_pkgsrc}/share/licenses/"

	install -Dm644 "${srcdir}/${_pkgsrc}/include/${_pkgname}"/* -t "${pkgdir}/usr/include/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgsrc}/lib/cmake/${_pkgname}"/* -t "${pkgdir}/usr/lib/cmake/${_pkgname}"

	cp -ar "${srcdir}/${_pkgsrc}/share" "${pkgdir}/usr/"
}
