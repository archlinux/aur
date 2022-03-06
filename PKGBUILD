# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=newbreeze-git
pkgver=v3.0.0.rc8.r24.a2c49b7
pkgrel=1
pkgdesc="A fast and light-weight file manager based on Qt"
arch=('x86_64')
url="https://gitlab.com/marcusbritanicus/NewBreeze"
license=('GPL')
depends=('qt5-base' 'qscintilla-qt5' 'jbig2dec' 'qt5-webengine' 'poppler' 'mpv' 'djvulibre' 'poppler-qt5' 'ffmpegthumbnailer' 'libarchive-qt' 'qdocumentview-git' 'mediainfo' 'qtermwidget' 'libzip')
makedepends=('git' 'lz4' 'meson')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
options=()
replaces=()
source=('git+https://gitlab.com/marcusbritanicus/NewBreeze.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/NewBreeze"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	arch-meson NewBreeze build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir/" ninja -C build install
}
