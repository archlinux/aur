# Maintainer: autumnontape <autumn at cyfox dot net>
# Contributor: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=3.4.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL-3.0-or-later')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'sdl2' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
	'auto-update-never-by-default.patch'
)
sha256sums=(
	'3c8f1b47ee42d89753d68e7c804ca3677b0c89a5d765d1fd4f80f9cdc29d3473'
	'6876958ccb023f3b62789d69fe6dd4d021f5f1aefd3eb5dc372e8b42c8b030e7'
)


prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -Np1 -i "${srcdir}/auto-update-never-by-default.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	qmake PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make install INSTALL_ROOT="${pkgdir}"
}
