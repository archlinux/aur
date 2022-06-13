# Maintainer: Shawn Chen <ufbycd at 163 dot com>

pkgname=kicad-jlc-manufacture-git
pkgdesc="一键生成符合jlc.com格式的Gerber、钻孔、BOM 物料清单、坐标文件"
pkgver=0.1.r20.g7e8321c
pkgrel=1
url="https://github.com/xtoolbox/kicad_tools"
arch=("any")
license=("MIT")
depends=("kicad>=5.1.0")
source=("$pkgname::git+https://hub.fastgit.xyz/xtoolbox/kicad_tools.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir"

	# copy plugin module
	mkdir -p "$pkgdir/usr/share/kicad/scripting/plugins"
	cp -afr "$pkgname" "$pkgdir/usr/share/kicad/scripting/plugins/JLC-Manufacture"

	# install license
	install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/JLC-Manufacture/LICENSE"
}
