# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=viewnior-hide-scrollbars
pkgver=1.6
pkgrel=2
pkgdesc="A simple, fast and elegant image viewer program"
arch=('x86_64')
url="http://xsisqox.github.com/Viewnior/"
license=('GPL3')
depends=('gtk2>=2.12' 'exiv2')
makedepends=('make' 'intltool>=0.35' 'pkgconfig>=0.9' 'perl>=5.8.1' 'gnome-common')

_tag_prefix="viewnior-hide-scrollbars"
source=(https://github.com/de-vri-es/Viewnior/archive/$_tag_prefix-$pkgver.tar.gz)
md5sums=('a0ecc4da01caf052dfc916e1349deb90')

provides=(viewnior)
conflicts=(viewnior)

prepare() {
	local _dir="$srcdir/Viewnior-$_tag_prefix-$pkgver"
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"

	cd "$_dir"
	./autogen.sh

	cd "$srcdir/build"
	"$_dir"/configure --prefix=/usr
}

build() {
	make -C "$srcdir/build"
}

package() {
	make -C  "$srcdir/build" DESTDIR="$pkgdir" install
}
