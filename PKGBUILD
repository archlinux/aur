# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-ruby
pkgver=5.5
pkgrel=1
_pkgdate=201605241149
pkgdesc="Support for Ruby in Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core")
optdepends=("ruby")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('3f090a7d2f59db330e55bef415e8a776')

package() {
	_dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/eclipse
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
