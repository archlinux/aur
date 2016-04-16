# Contributor: Darko82 <darko 82 (hat) gmail dotcom>
# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=photoflow
pkgver=0.2.6.r0.g2c380bd
pkgrel=2
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
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DINSTALL_PREFIX=/usr
	make
}

package() {
    cd "${srcdir}/${pkgname%-*}"
    make DESTDIR="$pkgdir/" install
}
