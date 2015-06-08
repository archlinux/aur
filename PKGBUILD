# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-tcl
pkgver=5.0.0
pkgrel=1
_pkgdate=201306060709
pkgdesc="TCL IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core")
optdepends=("eclipse-dltk-itcl" "eclipse-dltk-xotcl")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-${pkgver:0:3}-$_pkgdate/${pkgname#eclipse-}-I-$_pkgdate.zip")
md5sums=('33fbbea1abd130851b9194e45fee22f8')

package() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
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
