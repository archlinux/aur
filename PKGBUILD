# Maintainer: Damglador <damglador@gmail.com>

pkgname=undertalemodtool-bin
_pkgname=undertalemodtool

pkgver=0.8.3.0
pkgrel=3
arch=('x86_64')

pkgdesc="The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)"
url="https://github.com/UnderminersTeam/UndertaleModTool"
license=("GPL-3.0")

depends=("wine")
makedepends=("unzip")
provides=("$_pkgname")
options=("!strip" "!debug")

source=(
	"${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/UndertaleModTool_v${pkgver}-Windows-SingleFile.zip"
    "${_pkgname}.sh"
	"undertalemodtool.exe.desktop"
	"gamemaker-data.xml"
	"icon.png"
	)
sha256sums=(
    'e793d4c8f6abb631ec20a727e709a1959f10a2a4a1af0a8d58b6aab774d4e264'
    'feb2961625d3a959c3c5e06a1dc57451f4baf14e71fa09585f77fb78ba0dd251'
    'b117db1939eaf99652da0617f82e6994e0e69ac45d993e504fb766793f2d7773'
	'SKIP'
	'SKIP'
	)


noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
	unzip -qo "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}


package(){
	install -d "$pkgdir"/opt

	# Copy program files
	cp -r --preserve=mode "${_pkgname}-${pkgver}" "$pkgdir"/opt/"${_pkgname}"
	# Install launcher script
	install -Dm755 ${_pkgname}.sh "$pkgdir"/usr/bin/${_pkgname}
	# Install destkop file
	install -Dm644 undertalemodtool.exe.desktop "$pkgdir"/usr/share/applications/undertalemodtool.exe.desktop
	# Install icon
	install -Dm644 icon.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
	# Install MIME type
	install -Dm644 gamemaker-data.xml "$pkgdir"/usr/share/mime/packages/gamemaker-data.xml
}
