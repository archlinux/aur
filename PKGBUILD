# Contributor: Darko82 <darko 82 (hat) gmail dotcom>
# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=photoflow-git
pkgver=r2260.5fb3671
pkgrel=1
pkgdesc="Non-destructive, layer-based photo retouching including RAW image development"
arch=('i686' 'x86_64')
url="http://aferrero2707.github.io/PhotoFlow"
license=('GPL3')
depends=('exiv2' 'vips' 'gtkmm' 'pugixml' 'libjpeg-turbo')
makedepends=('git' 'gobject-introspection' 'cmake')
provides=('photoflow')
conflicts=('photoflow')

source=("${pkgname%-*}"::"git://github.com/aferrero2707/PhotoFlow.git#branch=stable")
md5sums=("SKIP")

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
