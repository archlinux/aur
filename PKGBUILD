# Maintainer: Ondrej Hruska <ondra@ondrovo.com>

_pkgname="sdscp"
pkgname="sdscp-git"

pkgver=1.3.3
pkgrel=1

pkgdesc="External preprocessor and pre-compiler for SDS-C (by AN-D.cz)"
arch=("any")
url="https://github.com/MightyPork/sdscp"
license=("GPL2")

depends=("python3")

makedepends=("git")

source=("git+https://github.com/MightyPork/sdscp.git")
provides=("sdscp")
replaces=("sdscp")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags | sed "s|-|.|g"
}

package() {
	# install license
	install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# install files in /usr/share
	mkdir "${pkgdir}/usr/share/${_pkgname}/"

	cp -pR "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/share/${_pkgname}/"

	# install link in /usr/bin
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${_pkgname}/sdscp" "${pkgdir}/usr/bin/sdscp"
}