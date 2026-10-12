# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=M-Igashi
_pkgname=(mp3rgain mp3rgui)
_pkgbase=${_pkgname[0]}
pkgbase=${_pkgbase}-bin
pkgname=(${_pkgname[0]}-bin ${_pkgname[1]}-bin)
_pkgdesc="Lossless MP3 volume adjustment"

pkgver=3.11.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc' 'libgcc')

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"${_pkgname}-${pkgver}.1::${_urlraw}/docs/man/${_pkgname}.1"
		"ICON-16-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_16x16.png"
		"ICON-32-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_32x32.png"
		"ICON-48-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_48x48.png"
		"ICON-64-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_64x64.png"
		"ICON-128-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_128x128.png"
		"ICON-256-${pkgver}.png::${_urlraw}/${_pkgname[1]}/icons/icon_256x256.png"
		"DESKTOP-${pkgver}.desktop::${_urlraw}/packages/aur-gui/${_pkgname[1]}.desktop")
source_x86_64=("${_pkgname[0]}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname[0]}-${_pkgvername}-${_barch[0]}.tar.gz"
			   "${_pkgname[1]}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname[1]}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname[0]}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname[0]}-${_pkgvername}-${_barch[1]}.tar.gz"
				"${_pkgname[1]}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname[1]}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('8e557208f0bd83f91b38dcc81ccf914c4c84060ab6dbc5072dbf369791ffc135'
            'b7412f90a10e36d2297e647775bc24e41376e788f2423f9f1f83ec121c64240c'
            '7a8920c25173161b0fc1f30f787ed29fabc891ed23f491c0a9f46d4afc593420'
            'c0f553ccb5e4d9f922d5651a99f757c4c6e4469226312ddd9146c5f151a2bf35'
            'd5663da72a2e7fadff722207147cd9103868a5b9de7da7483648b74b7971c174'
            '91dad3ec01217a81439663ab9a5838ae0a981aff4a673729db4009cf8594a4f1'
            '596a797bda4279ff17e66a3299bd7e28aa10ed7311f63b7e09142baa21d651ea'
            'd44f58c2eb6c2fc3ce21e45e357ffb49c22006f2279a95c74ef078d2227a3dea'
            '9837d092603c7c1749fad2857287d179ece88b1fdf1b25f36220dccbf92bb083'
            '502ed5dc6994e95e2d00f1714a3f90c4a0f14f2b18448a35eb7ff746850dcaed')
sha256sums_x86_64=('d184f8cd7fb3dce7e89cd383a7cae20eef60a045ee940768a8df00d752a5a48b'
                   '3e33c3862fbd890a7869a23d2442f850c822bcde8872dc40729ba6ec730e9084')
sha256sums_aarch64=('3650dd4996dad2206d83244bbf746662075ed27d3fac8fe360084eba68714348'
                    'f1665babd39d82d26226cd9274f95d5dd722e3645683bf46ad0ff70346da31d4')


package_mp3rgain-bin() {
	pkgdesc="${_pkgdesc} - A modern 'mp3gain' replacement"

	provides=("${_pkgname[0]}")

	depends+=()
	optdepends+=("${_pkgname[1]}")

	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname[0]}" "${pkgdir}/usr/bin/${_pkgname[0]}"

	install -Dm644 "${_pkgname[0]}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname[0]}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_mp3rgui-bin() {
	pkgdesc+="GUI application for '${_pkgname[0]}' - ${_pkgdesc}"

	provides=("${_pkgname[1]}")

	depends+=('glib2' 'gtk3' "${_pkgname[0]}")
	optdepends+=()

	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname[1]}" "${pkgdir}/usr/bin/${_pkgname[1]}"

	install -Dm644 "DESKTOP-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname[1]}.desktop"

	install -Dm644 "ICON-16-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname[1]}.png"
	install -Dm644 "ICON-32-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname[1]}.png"
	install -Dm644 "ICON-48-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname[1]}.png"
	install -Dm644 "ICON-64-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname[1]}.png"
	install -Dm644 "ICON-128-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname[1]}.png"
	install -Dm644 "ICON-256-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname[1]}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
