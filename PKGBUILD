# Maintainer: Lukas Sabota (lukas@lwsabota.com)
# Contributor: Lukas Sabota (lukas@lwsabota.com)
pkgname=ggmud-svn
pkgver=273
pkgrel=2
pkgdesc="GTK2 mud client inspired by tintin and sclient."
arch=('i686' 'x86_64')
url="http://www.ggsoft.org/ggmud/"
license=('GPL')
depends=('gtk2' 'lua')
makedepends=('subversion')
source=(svn://svn.code.sf.net/p/ggmud/code/trunk/ggmud/)
sha256sums=('SKIP')

pkgver() {
	cd ggmud
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	mkdir -p ggmud/build
	cd ggmud/build
	sed -i "s/httpfetch zlib/httpfetch zlib m dl/" ../CMakeLists.txt
	cmake ../
	make
}

package() {
	cd ggmud/build
	install -D -m755 ggmud "$pkgdir/usr/bin/$pkgname"
	install -D -m644 ../gg_help.txt "${pkgdir}/usr/share/$pkgname/gg_help.txt"
	install -D -m644 ../ggmud.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -D -m644 ../ggmud.png "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}
