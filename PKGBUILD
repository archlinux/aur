# Contributor: Darko82 <darko 82 (hat) gmail dotcom>
# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=photoflow
pkgver=0.2.8.r2.gdf03f253
pkgrel=1
pkgdesc="Non-destructive, layer-based photo retouching including RAW image development"
arch=('i686' 'x86_64')
url="http://aferrero2707.github.io/PhotoFlow"
license=('GPL3')
depends=('libgexiv2' 'vips' 'gtkmm' 'pugixml')
makedepends=('git' 'gobject-introspection' 'cmake')
provides=('photoflow')
conflicts=('photoflow')

source=("${pkgname%-*}"::"git://github.com/aferrero2707/PhotoFlow.git")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname%-*}
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_PREFIX=/usr -DBUNDLED_GEXIV2=OFF ..
	make
}

package() {
    cd "${srcdir}/${pkgname%-*}/build"
    make DESTDIR="$pkgdir/" install
}
