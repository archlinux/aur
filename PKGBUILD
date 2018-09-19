# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=intellij-idea-community-edition-no-jre
_appname=jetbrains-idea-ce
pkgver=2018.2.4
_buildver=182.4505.22
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
md5sums=('d6be466b1e11a49ebcc85c5e6ccba7ed'
         '56d945e72cc22162d5be26af027999dd')

package() {
	install -d "$pkgdir"/{usr/share/$_appname,usr/bin}
	mv idea-IC-${_buildver}/* "$pkgdir"/usr/share/$_appname

	# https://youtrack.jetbrains.com/issue/IDEA-185828
	chmod +x "$pkgdir"/usr/share/$_appname/plugins/maven/lib/maven3/bin/mvn

	ln -s /usr/share/$_appname/bin/idea.sh "$pkgdir"/usr/bin/idea-ce
	install -D -m644 "$srcdir"/jetbrains-idea-ce.desktop "$pkgdir"/usr/share/applications/jetbrains-idea-ce.desktop
	install -D -m644 "$pkgdir"/usr/share/$_appname/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$_appname".png
	
	# workaround FS#40934
	sed -i 's|lcd|on|'  "$pkgdir"/usr/share/$_appname/bin/*.vmoptions
}
