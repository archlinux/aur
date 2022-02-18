# Maintainer: Colin Reeder <colin@vpzom.click>

pkgname=pure-maps
pkgdesc="An application for Linux to display vector and raster maps, places, routes, etc."
pkgver=2.9.2
pkgrel=3
arch=("x86_64" "aarch64")
source=("https://github.com/rinigus/pure-maps/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('789dd7fdb865bd795e8695623a9c3dcbb0e22566614f0491069571fc211d7b89')
depends=("s2geometry" "python3" "qt5-base" "qt5-location" "qt5-declarative" "qt5-quickcontrols2" "nemo-qml-plugin-dbus" "python-pyotherside" "mapbox-gl-qml" "qt5-sensors" "python-gpxpy" "python-geomag" "kirigami2" "qt5-multimedia")
makedepends=("qt5-tools" "cmake")
url="https://rinigus.github.io/pure-maps/"
license=("GPL3")

build() {
	cmake -B build -S "$pkgname-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_BUNDLED_GEOMAG=OFF
    make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
