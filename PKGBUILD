# Maintainer: Damglador <damglador@gmail.com>

pkgname=undertalemodtool-bin
_pkgname=undertalemodtool

pkgver=0.7.0.0
pkgrel=1
arch=('x86_64')

pkgdesc="The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)"
url="https://github.com/UnderminersTeam/UndertaleModTool"
license=("GPL-3.0-only")

depends=("wine")
makedepends=("unzip")

source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/UndertaleModTool_v${pkgver}-Windows-SingleFile.zip" 
        "${_pkgname}.sh" 
		"icon.png" 
		"undertalemodtool.exe.desktop")
sha256sums=("838c4c01e6517c91c8ff0817030ef288a81142e2c3e00c15c6b869ab87c28ca8" 
			"44c0b92d7ce0226978a6b256e0988161524cc7171e029bafc43d59815ddff2ef" 
			"SKIP" 
			"67144b28927cc4835a9ec6e567f927478fb510f77b3d2bcaa12ef505e3e54978")


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
}
