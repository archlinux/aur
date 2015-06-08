# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-core
pkgver=5.0
pkgrel=3
_pkgdate=201306060709
pkgdesc="Support for dynamic languages in Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-emf")
replaces=("eclipse-dltk-core-index")
optdepends=("eclipse-dltk-core-index" "eclipse-dltk-javascript" "eclipse-dltk-mylyn" "eclipse-dltk-python" "eclipse-dltk-rse" "eclipse-dltk-ruby" "eclipse-dltk-tcl")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-I-$_pkgdate.zip")
md5sums=('fa828874f889e86fdbb050e1b164017b')

package() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
	cd $srcdir
	install -dm755 $_dest
	find features plugins -type f -exec \
		install -Dm644 {} $_dest/{} \;
	# DLTK requires features/*.jar files extracted
	find $_dest/features -type f -name '*.jar' | while read f; do
		install -dm755 ${f%*.jar} && cd ${f%*.jar}
		jar xf $f && rm $f
	done
}
