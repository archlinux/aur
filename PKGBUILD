# Maintainer: Merlijn Verstraete <toxicmushroom + aur A_ melijn · com>
# Contributor: Sander Van Balen <aur at sandervanbalen dot be>
# Contributor: imec-DistriNet research group, Department of Computer Science, KU Leuven - University of Leuven, Belgium

pkgname=verifast-bin
_pkgname=verifast
pkgver=25.02
pkgrel=1
pkgdesc="Research prototype tool for modular formal verification of C and Java programs"
arch=("any")
url="https://github.com/verifast/verifast"
license=('MIT')
depends=()
conflicts=()
source=("http://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz" "https://raw.githubusercontent.com/verifast/verifast/master/LICENSE.md")
sha256sums=("5d5c87d11b3d735f44c3f0ca52aebc89e3c4d1119d98ef25188d07cb57ad65e8" "309c4afede6331d0b813e5f0e850d6b638370a70dd31fa2fbf5e40bc5421b49f")

prepare() {
    # idk what the proper way to do this is, this feels wrong
    cp ../$_pkgname.desktop $_pkgname.desktop
    cp ../icon.png icon.png
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt"

	install -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	_destdir="/opt/${_pkgname}"
	destdir="${pkgdir}${_destdir}"
	cp -r "${srcdir}/${_pkgname}-${pkgver}" "${destdir}"

    install -d "$pkgdir"/usr/share/applications
    install -m644 "${srcdir}/icon.png" "${destdir}/icon.png"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	
    ln -s "${_destdir}/bin/verifast" "${pkgdir}/usr/bin/verifast"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/vfide"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/verifast-ide"
}
