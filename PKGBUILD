# Maintainer: Xavier Pedraza <xpedraza542@gmail.com>
_build=892
_base=chromapper
pkgname="${_base}-bin"
pkgver=0.13.892
pkgrel=2
pkgdesc='Unity-based map editor for Beat Saber (binary)'
arch=(x86_64)
url='https://github.com/Caeden117/ChroMapper/'
license=('GPL-2.0-only')
provides=("${_base}=${pkgver}")
conflicts=("${_base}" "${_base}-dev" "${_base}-dev-bin")
options=(!strip)
source=("https://cm.topc.at/nix/${_build}/Linux.tar.gz" "https://cm.topc.at/cm.svg")
sha256sums=("f4c4f2199a8b4fed4c5cd296105232b5f8ef013ab51a0f402421613352e5ae5c" "533bdae8c7e95a94a4941a01de5f0ee94684ac2119d7297e4f5abe950ec64e80")

build() {
	# Create desktop entry
	cd "${srcdir}"
	echo "[Desktop Entry]" >> "${pkgname}.desktop"
	echo "Type=Application" >> "${pkgname}.desktop"
	echo "Version=${pkgver}" >> "${pkgname}.desktop"
	echo "Exec=/usr/bin/${pkgname}" >> "${pkgname}.desktop"
	echo "Name=ChroMapper" >> "${pkgname}.desktop"
	echo "Comment=${pkgdesc}" >> "${pkgname}.desktop"
	echo "Icon=${_base}" >> "${pkgname}.desktop"
	echo "Terminal=false" >> "${pkgname}.desktop"
	echo "Categories=Utility;Game;" >> "${pkgname}.desktop"	
}

package() {
	install -dm755 "${pkgdir}/opt/${_base}"
	cd "${srcdir}/chromapper"
	cp -rt "${pkgdir}/opt/${_base}" *
    chmod +x "${pkgdir}/opt/${_base}/ChroMapper"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/cm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_base}.svg"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_base}/ChroMapper" "${pkgdir}/usr/bin/${pkgname}"	
}

