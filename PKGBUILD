# Maintainer: Dobromir Marinov <mr.d.marinov@gmail.com>
# Maintainer: Tomasz Lipinski <aur@t3xh.nl>

pkgname=intellij-idea-community-edition-jre
_appname=jetbrains-idea-ce
pkgver=2025.2.5
_buildver=252.28238.7
pkgrel=1
pkgdesc="Intellij Idea Community Edition with bundled JRE"
arch=('any')
url="http://www.jetbrains.com/idea/"
license=("Apache2")
depends=('giflib' 'libxtst' 'python' 'sh' 'ttf-font' 'libdbusmenu-glib')
provides=("$_appname")
conflicts=("$_appname")
source=("https://download.jetbrains.com/idea/ideaIC-$pkgver.tar.gz"
		"$_appname.desktop")
sha256sums=('995c334cc3e143f13467abafef07a1ccf7d06275512bb6f4c91123948786ab7c'
            '4adcbb685898ba54516eeb1fd84ca8f1aa3bf3dca698f84a00eaafd115f5c336')

package() {
	cd idea-IC-"$_buildver"

	# workaround FS#40934
	sed -i 's/lcd/on/' bin/*.vmoptions

	install -dm 755 "$pkgdir"/usr/bin
	install -dm 755 "$pkgdir"/usr/share/{licenses,pixmaps,"$_appname",icons/hicolor/scalable/apps}
	cp -dr --no-preserve='ownership' bin jbr lib plugins build.txt product-info.json "$pkgdir"/usr/share/"$_appname/"
	cp -dr --no-preserve='ownership' license "$pkgdir"/usr/share/licenses/"$_appname"
	ln -s /usr/share/"$_appname"/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$_appname".png
	ln -s /usr/share/"$_appname"/bin/idea.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"$_appname".svg
	install -Dm 644 ../"$_appname".desktop -t "$pkgdir"/usr/share/applications/
	ln -s /usr/share/"$_appname"/bin/idea "$pkgdir"/usr/bin/idea-ce
}
