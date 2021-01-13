# Maintainer Madison Brooke <madgeraccoon@outlook.com>

pkgname=mineonline
pkg_case=MineOnline
pkgdev=codieradical
depends=('jre8' 'jq')
pkgver=$(curl -s "https://api.github.com/repos/codieradical/MineOnline/releases/latest" | jq -r '.tag_name')
pkgrel=2
pkgdesc="Launch old versions of Minecraft just as you remembered them, only without a browser."
url="http://mineonline.codie.gg"
license=('CCPL:by-nc')
arch=('any')
source=("https://github.com/${pkgdev}/${pkg_case}/releases/download/${pkgver}/${pkg_case}.jar"
		"${pkg_case}.desktop"
		"${pkg_case}.png"
		"${pkgname}")
noextract=('MineOnline.jar')
md5sums=('SKIP'
		 'ee7c23b2f3f53e811960769c676b788b'
		 '21c69aad5d0faae6e05271651631c7ca'
		 '199197ea135ff706fc3fc9a35e5eca20')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{bin,share/{applications,pixmaps,java/$pkgname}}
	install -m 755 $pkgname $pkgdir/usr/bin/
	install -m 755 ${pkg_case}.jar $pkgdir/usr/share/java/$pkgname/
	install -m 644 $srcdir/${pkg_case}.desktop $pkgdir/usr/share/applications/
	install -m 644 $srcdir/${pkg_case}.png $pkgdir/usr/share/pixmaps/
	rm $startdir/${pkg_case}.jar
}
