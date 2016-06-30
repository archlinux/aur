# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-xotcl
pkgver=5.5
pkgrel=1
_pkgdate=201605241149
pkgdesc="XOTcl IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-tcl")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('c0ef3c04ee16ee684e203d9c0269573f')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse
	cd $srcdir
	install -dm755 $_dest
	find plugins features -type f -exec install -Dm644 {} \
		$_dest/{} \;
	# DLTK requires features/*.jar files extracted
	find $_dest/features -type f -name '*.jar' | while read f; do
		install -dm755 ${f%*.jar} && cd ${f%*.jar}
		jar xf $f && rm $f
	done
}
