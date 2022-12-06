# Mantainer: BlendyDev 

pkgname=ase-assistant
pkgver=0.1
pkgrel=1
pkgdesc="Pokemon Gen 4 Arbitrary Script Execution Payload converter"
arch=('any')
url="https://voidmatrixteam.github.io/Voidmatrix/src/script_assistant.html"
license=('unknown')
makedepends=("nodejs-nativefier")
source=(
	"${pkgname}.png" "${pkgname}.desktop"
)

build() {
	echo ${srcdir}
	cd ${srcdir}
	nativefier --name "Gen IV ASE Assistant" --icon "${pkgname}.png" --verbose --portable "${url}"
}
package() {
    install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
	_folder=$(ls "${srcdir}" | grep "GenIVASEAssistant-linux-")
	_binary="$(ls "${srcdir}/${_folder}" | grep "GenIVASEAssistant")"
	echo "a"
	echo "b"
	cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
	echo "c"
	ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
	echo "d"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "512x512" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		echo ${_size}
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}
sha256sums=('a482c5af4a1d49383ef91c3635f6eb21edd8a0b688de7d1a31d195550c29234b'
            'a1401428003f936a8d1a069a04f20a1aa3dca49be09bcc61909ff2615fc907ec')
