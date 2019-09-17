# Maintainer: Lukas Sabota <lukas _at_ lwsabota.com>
pkgname=ggmud
pkgver=0.9.4
pkgrel=2
epoch=
pkgdesc="GTK2 mud client inspired by tintin and sclient"
arch=('i686' 'x86_64')
url="http://www.ggsoft.org/ggmud/"
license=('GPL')
depends=('gtk2' 'lua')
makedepends=('cmake')
source=("https://sourceforge.net/projects/ggmud/files/ggmud/$pkgver/GGMud-src.tar.gz")
md5sums=('653a1cb6177b1d0419ee50597540b9e0')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	sed -i "s/httpfetch zlib/httpfetch zlib m dl/" ../CMakeLists.txt
	cmake ../
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	install -D -m755 ggmud "$pkgdir/usr/bin/$pkgname"
	install -D -m644 ../gg_help.txt "${pkgdir}/usr/share/$pkgname/gg_help.txt"
	install -D -m644 ../ggmud.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -D -m644 ../ggmud.png "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}
