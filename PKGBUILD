# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-resources-monitor
pkgname=plasma5-applets-resources-monitor
_pkgver="2.6.2"
pkgver="${_pkgver/-/_}"
pkgrel=1
pkgdesc="Plasma 5 applet for monitoring CPU and RAM"
arch=('any')
url="https://www.pling.com/p/1527636/"
license=('GPL')
depends=(
    'ksysguard'
    'plasma-workspace'
)
optdepends=()
makedepends=('extra-cmake-modules')
source=("https://github.com/orblazer/${_upstream_name}/archive/v${_pkgver}.tar.gz")
sha256sums=('362b55c7b35974e5c17e473bd65a5eab142cccc3576e0f11a3cc7e353783d3f1')

build() {
  cd "$srcdir/$_upstream_name-$_pkgver"
  mkdir -p build
  cd build
  cmake .. \
        -DCMAKE_INSTALL_PREFIX="$(kf5-config --prefix)" \
        -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_upstream_name-$_pkgver/build"
  make install DESTDIR="${pkgdir}"
}
