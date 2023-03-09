# Maintainer: éclairevoyant

pkgname=pure-maps
pkgdesc="Display vector and raster maps, places, routes, etc."
pkgver=3.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://rinigus.github.io/$pkgname"
license=(GPL3)
depends=(abseil-cpp hicolor-icon-theme kirigami2 mapbox-gl-qml
         nemo-qml-plugin-dbus python-geomag python-gpxpy python-pyotherside
         qt5-location qt5-quickcontrols2 qt5-sensors s2geometry)
makedepends=(cmake qt5-tools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rinigus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=('66940e0d61706e010f9f2b38603a974f17424ea0fa69388db5c4a9ccbb690efcd7714b73a251805a5f62b74edab12c10c669f35f62c82f150b8c5ed939555871')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_BUNDLED_GEOMAG=OFF \
		-Dflavor=kirigami \
		-DCMAKE_CXX_STANDARD=17 # use the same C++ standard as abseil-cpp
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
