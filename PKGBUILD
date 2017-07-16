# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
pkgname=jedit-pkgbuild 
pkgver=4.0.0
pkgrel=3
pkgdesc='jEdit PKGBUILD edit mode'
arch=('any')
url='https://bitbucket.org/ur6lad/jedit-pkgbuild'
license=('GPL')
depends=('jedit' 'xmlstarlet')
install=jedit-pkgbuild.install
source=($pkgname-$pkgver.tar.bz2::https://bitbucket.org/ur6lad/$pkgname/get/$pkgver.tar.bz2)
noextract=($pkgname-$pkgver.tar.bz2)
md5sums=('f9ab018b0a281d18e1ead326c4654757')
sha256sums=('c0b6f9360a8f7e4f6dc20ebdb0af286c5cd137c4fb73c1ed0b4eff245f52f0e8')

prepare() {
	cd "$srcdir"

	tar -xf $pkgname-$pkgver.tar.bz2 --strip-components=1
}

package() {
	#  catalog.dtd is required to edit the edit mode catalog (XML)
	install -d "$pkgdir"/usr/share/$pkgname
	install -m 644 "$srcdir"/catalog.dtd "$pkgdir"/usr/share/$pkgname/catalog.dtd
	ln -s /usr/share/java/jedit/modes/catalog "$pkgdir"/usr/share/$pkgname/catalog.xml

	# edit mode file
	install -d "$pkgdir"/usr/share/java/jedit/modes
	install -m 644 "$srcdir"/pkgbuild.xml "$pkgdir"/usr/share/java/jedit/modes/pkgbuild.xml
}
