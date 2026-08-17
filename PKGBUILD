# Maintainer:  shtrophic <aur at shtrophic dot net>

pkgname=deadbeef-plugin-statusnotifier
pkgver=1.7
pkgrel=1
pkgdesc="plugin for DeaDBeeF that replaces its default tray icon with one that supports the StatusNotifierIitem protocol"
url="https://github.com/vovochka404/deadbeef-statusnotifier-plugin"
arch=(i686 x86_64)
license=(GPL-3.0-or-later)
source=("$url/archive/v$pkgver.tar.gz")
depends=(deadbeef gtk3 libdbusmenu-glib)
makedepends=(cmake ninja)
b2sums=('26a7d383c4d438081cadc132edfd7c46c850f62fd164fc4da6e53894e49815f9d0177ec493d041c6f27257c5368571afe0b9df4526ae3401c1d7c69ba9165719')

build() {
	cmake -B build -GNinja -Wno-dev \
	    -DCMAKE_INSTALL_PREFIX='/usr' \
	    -DCMAKE_BUILD_TYPE='None' \
	    -DUSE_GTK=OFF \
	    -S "deadbeef-statusnotifier-plugin-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
