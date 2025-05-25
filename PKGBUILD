# Maintainer:  shtrophic <aur at shtrophic dot net>

pkgname=deadbeef-plugin-statusnotifier
pkgver=1.6
pkgrel=2
pkgdesc="plugin for DeaDBeeF that replaces its default tray icon with one that supports the StatusNotifierIitem protocol"
url="https://github.com/vovochka404/deadbeef-statusnotifier-plugin"
arch=(i686 x86_64)
license=(GPL-3.0-or-later)
source=("$url/archive/v$pkgver.tar.gz")
depends=(deadbeef gtk3 libdbusmenu-glib)
makedepends=(cmake ninja)
b2sums=('2789b6dae5b6028a8185e615c9da7cb17888ee836c0786e9a602c85261fe5c08be56192e366b784291aab9b9300bd150494e585b6c56bb6ef54bdac33a82e57d')

build() {
	cmake -B build -GNinja -Wno-dev \
	    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	    -DCMAKE_INSTALL_PREFIX='/usr' \
	    -DCMAKE_BUILD_TYPE='None' \
	    -DUSE_GTK=OFF \
	    -S "deadbeef-statusnotifier-plugin-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
