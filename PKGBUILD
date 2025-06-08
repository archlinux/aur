# Maintainer: Damglador <damglador@gmail.com>

pkgname=undertalemodtool-bin
_pkgname=undertalemodtool

pkgver=0.8.2.0
pkgrel=1
arch=('x86_64')

pkgdesc="The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)"
url="https://github.com/UnderminersTeam/UndertaleModTool"
license=("GPL-3.0")

depends=("wine" "bash")
makedepends=("unzip")

source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/UndertaleModTool_v${pkgver}-Windows-SingleFile.zip" 
        "${_pkgname}.sh"
		"undertalemodtool.exe.desktop"
		"gamemaker-data.xml"
		"icon.png")
sha256sums=("5b8a23a2b742ac65b06ae54363565e216f9f38635a308443fb760c13f740d82c"
			"1638dabce4fbd32d515156442def0dec3fef8e3c2e1fa9748f81f0151cb38430"
			"156ab7105b93ed653aa180e91535e41a5d56de279c8707c6acc23e526209f655"
			"SKIP"
			"SKIP")


noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
	unzip -q "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}


package(){
	install -d "$pkgdir"/opt

	# Copy program files
	cp -rdp --no-preserve=ownership "${_pkgname}-${pkgver}" "$pkgdir"/opt/"${_pkgname}"
	# Install launcher script
	install -Dm755 ${_pkgname}.sh "$pkgdir"/usr/bin/${_pkgname}
	# Install destkop file
	install -Dm644 undertalemodtool.exe.desktop "$pkgdir"/usr/share/applications/undertalemodtool.exe.desktop
	# Install icon
	install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
	# Install MIME type
	install -Dm644 gamemaker-data.xml "$pkgdir"/usr/share/mime/packages/gamemaker-data.xml
}
