# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-ruby
pkgver=5.0.0
pkgrel=1
_pkgdate=201306060709
pkgdesc="Support for Ruby in Eclipse (Stable Stream)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core")
optdepends=("ruby")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-${pkgver:0:3}-$_pkgdate/${pkgname#eclipse-}-I-$_pkgdate.zip")
md5sums=('d5017113a49a0cd2b7504f23b1d27458')

package() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
	cd $srcdir
	install -dm755 $_dest
	find features plugins -type f -exec install -Dm644 {} \
		$_dest/{} \;
	# DLTK requires features/*.jar files extracted
	find $_dest/features -type f -name '*.jar' | while read f; do
		install -dm755 ${f%*.jar} && cd ${f%*.jar}
		jar xf $f && rm $f
	done
}
