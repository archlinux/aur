# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad-qt5
_pkgname=featherpad
pkgver=1.3.3
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor'
arch=('any')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt5-svg' 'qt5-translations' 'qt5-x11extras')
makedepends=('cmake' 'ninja' 'qt5-tools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz"{,.asc}
        'featherpad.appdata.xml')
sha256sums=('1be94e5112fec3b8305f5c3cb2f62a2262c1df6a773a03d599507e5a31521ab8'
            'SKIP'
            'd67bc310f4c31257b795beabbce2d0887640088b0fe3040307906da0d9f760d9')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

build() {
  cmake -S FeatherPad-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
}
