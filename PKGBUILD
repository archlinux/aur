# Maintainer: Thomas Quillan <tjquillan@gmail.com>
# Maintainer: Dobromir Marinov <mr.d.marinov@gmail.com>

pkgname=intellij-idea-community-edition-jre
_appname=jetbrains-idea-ce
pkgver=2021.2.3
_buildver=212.5457.46	
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
sha256sums=('582eb0b6dc9cb3c181d179638ccae54a89cfe73bd59fac6806c4fee8b586d998'
            '91aa66e16e428d595c9f76a02f5a6d54d6fb0b1d1ccac4159cfb7070cff26a4b')

package() {
	cd idea-IC-"$_buildver"

	# workaround FS#40934
	sed -i 's/lcd/on/' bin/*.vmoptions

	install -dm 755 "$pkgdir"/usr/bin
	install -dm 755 "$pkgdir"/usr/share/{licenses,pixmaps,"$_appname",icons/hicolor/scalable/apps}
	cp -dr --no-preserve='ownership' bin jbr lib plugins redist build.txt product-info.json "$pkgdir"/usr/share/"$_appname/"
	cp -dr --no-preserve='ownership' license "$pkgdir"/usr/share/licenses/"$_appname"
	ln -s /usr/share/"$_appname"/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$_appname".png
	ln -s /usr/share/"$_appname"/bin/idea.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/"$_appname".svg
	install -Dm 644 ../"$_appname".desktop -t "$pkgdir"/usr/share/applications/
	ln -s /usr/share/"$_appname"/bin/idea.sh "$pkgdir"/usr/bin/idea-ce
}
