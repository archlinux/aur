# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=emptyclip
pkgver=2.0.4
pkgbuild=8007fb22
pkgfullname=(${pkgname}-${pkgver}-${pkgbuild})
pkgrel=1
pkgdesc="A top-down shooter action RPG"
arch=('i686' 'x86_64')
url="https://empty-clip.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'sdl3' 'openal' 'libvorbis' 'libogg' 'libwebp' 'freetype2' 'sqlite' 'zlib')
makedepends=('cmake')
source=(
	"https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz"
	"fix.patch"
)
sha256sums=(
	'f7cc69a963a5ca4fd0ee276cff8ac61d5b91bc543dc5de7d09e699fc6d7f6f3f'
	'0d9e8eaec2f9a584a90f79e4e72d88bfd313b15fe0a0b8e9a8cf8e82297794d5'
)

prepare() {
	cd "$srcdir/$pkgfullname"
	patch --forward --strip=1 --input="$srcdir/fix.patch"
}

build() {
	cd "$srcdir/$pkgfullname"
	cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_VERSION=OFF -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install
}
