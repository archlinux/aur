# Maintainer: SiHuan <sihuan at sakuya.love>
_pkgname=Spritecraft
pkgname=spritecraft
pkgver=1.1.7
pkgrel=1
pkgdesc="Create your own Pixel Art by converting the pixels of any image or picture to Minecraft blocks!"
arch=('any')
url="https://www.autosaved.org/Spritecraft"
license=('custom')
depends=('java-runtime' 'bash')
source=(spritecraft.zip::"https://www.autosaved.org/files/${pkgname}/${_pkgname}%20${pkgver}.zip")
sha512sums=('8d2da40fb033fce6b07e62983a9503743ca6ba6a093800634c12e1ea866a10b8ed7b3b2d93874fdaee0c06485c178be2f4cdc70ee4ae98a712157927c61daa09')

package() {
	install -Dm644 "$srcdir/$_pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	echo "#! /bin/bash
java -jar -Xmx1024m /usr/share/java/spritecraft/spritecraft.jar" > "$srcdir/$pkgname"

	echo "[Desktop Entry]
Name=Spritecraft
Comment=Create your own Pixel Art by converting the pixels of any image or picture to Minecraft blocks!
Exec=spritecraft
Terminal=false
Type=Application
Categories=Game;" > "$srcdir/$_pkgname.desktop"

	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

}
