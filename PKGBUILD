# Maintainer: Jonas Gunz <arch@jonasgunz.de>
pkgname=xcsoar
pkgver=7.44
pkgrel=1
pkgdesc="... the open-source glide computer"
arch=( x86_64 )
url="https://github.com/XCSoar/XCSoar"
license=('GPL-2')
depends=(
	libxslt sox zip quilt dbus
	zlib c-ares curl lua libinput sdl sdl_ttf
	libpng libjpeg-turbo mesa glm fmt libsodium freetype2
	libtiff libgeotiff openssl alsa-lib librsvg
	ttf-dejavu ttf-roboto
)
makedepends=(
	git gcc make gettext automake imagemagick
	perl perl-xml-parser python
)
options=( !lto !buildflags )
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
_srcname="XCSoar-$pkgver"
b2sums=(
	'87659558bf298da4ba591fdac217f905542bd59a3655fe6f26de405f94481df7de5fe6103474f058b3d388c7bf8b5f76bf69acf8da26428aa0b0cb7f2f12e09b'
)

build() {
	cd "$srcdir/$_srcname"
	make DEBUG=n -j$(nproc)
}

package() {
	local BINBASE="$srcdir/$_srcname/output/UNIX/bin"
	local DEST="$pkgdir/usr/bin"

	mkdir -p "$DEST"

	install "$BINBASE/vali-xcs" "$DEST/vali-xcs"
	install "$BINBASE/xcsoar" "$DEST/xcsoar"
}
