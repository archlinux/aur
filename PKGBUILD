# Maintainer: Mingi Sung <fiestalake@disroot.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad-qt5
_pkgname=featherpad
pkgver=1.4.1
pkgrel=1
pkgdesc='Lightweight Qt5 plain text editor'
arch=(x86_64 i686 aarch64 armv7h)
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt5-svg' 'qt5-translations' 'qt5-x11extras')
makedepends=('cmake' 'ninja' 'qt5-tools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz"{,.asc}
        'featherpad.appdata.xml')
b2sums=('8bfa805e29bd1a6812e8384db64883eb0b7a848a3ad394450ae7feb4fbee91cd9c16179d3f957f72acf576d4bb54f4844bb2d9891a7c1aca0eadf23db9c159eb'
        'SKIP'
        'e194bea66d97fdcc7ebd7e25ee6cbce9c76d90b56a278325dc235d8e4dfccfb6c1fd4480e54cda9c245b6de1dfde261892d5e559c66acfe5a0637ed4216abae7')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

build() {
  cmake -S FeatherPad-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
}
