# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=intellij-idea-community-edition-no-jre
_appname=jetbrains-idea-ce
pkgver=2018.3.2
_buildver=183.4886.37
pkgrel=1
pkgdesc="Intellij Idea Community Edition without bundled JRE"
arch=('any')
url="http://www.jetbrains.com/idea/"
license=("Apache2")
depends=("giflib" "libxtst" "java-environment")
provides=("$_appname")
conflicts=("$_appname")
source=("https://download.jetbrains.com/idea/ideaIC-$pkgver-no-jdk.tar.gz"
		"$_appname.desktop")
md5sums=('e6f4a6a20eb7c45f99ab924d515efaf5'
         '56d945e72cc22162d5be26af027999dd')

package() {
	cd idea-IC-"$_buildver"

	# workaround FS#40934
	sed -i 's/lcd/on/' bin/*.vmoptions

	install -dm 755 "$pkgdir"/usr/bin
	install -dm 755 "$pkgdir"/usr/share/{licenses,pixmaps,"$_appname"}
	cp -dr --no-preserve='ownership' bin lib plugins redist "$pkgdir"/usr/share/"$_appname/"
	cp -dr --no-preserve='ownership' license "$pkgdir"/usr/share/licenses/"$_appname"
	ln -s /usr/share/"$_appname"/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$_appname".png
	install -Dm 644 ../"$_appname".desktop -t "$pkgdir"/usr/share/applications/
	ln -s /usr/share/"$_appname"/bin/idea.sh "$pkgdir"/usr/bin/idea-ce
}
