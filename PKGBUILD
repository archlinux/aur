# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=intellij-idea-community-edition-jre
_appname=jetbrains-idea-ce
pkgver=2018.1.2
_buildver=181.4668.68
pkgrel=1
pkgdesc="Intellij Idea Community Edition with bundled JRE"
arch=('any')
options=(!strip)
url="http://www.jetbrains.com/idea/"
license=("Apache2")
depends=("giflib" "libxtst")
provides=("$_appname")
conflicts=("$_appname")
source=("https://download.jetbrains.com/idea/ideaIC-$pkgver.tar.gz"
	"$_appname.desktop")
md5sums=('f53d01a87baf4c8a066c4921f8a4d459'
         '9e5798fd87d09fa8f2f24721b6af4d5f')

package() {
	install -d "$pkgdir"/{opt/$_appname,usr/bin}
	mv idea-IC-${_buildver}/* "$pkgdir"/opt/$_appname

	# https://youtrack.jetbrains.com/issue/IDEA-185828
	chmod +x "$pkgdir"/opt/$_appname/plugins/maven/lib/maven3/bin/mvn

	ln -s /opt/$_appname/bin/idea.sh "$pkgdir"/usr/bin/$_appname
	install -D -m644 "$srcdir"/jetbrains-idea-ce.desktop "$pkgdir"/usr/share/applications/jetbrains-idea-ce.desktop
	install -D -m644 "$pkgdir"/opt/$_appname/bin/idea.png "$pkgdir"/usr/share/pixmaps/"$_appname".png
	
	# workaround FS#40934
	sed -i 's|lcd|on|'  "$pkgdir"/opt/$_appname/bin/*.vmoptions
}
