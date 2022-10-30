# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-resources-monitor
pkgname=plasma5-applets-resources-monitor
_pkgver="2.7.1"
pkgver="${_pkgver/-/_}"
pkgrel=3
pkgdesc="Plasma 5 applet for monitoring CPU and RAM"
arch=('any')
url="https://www.pling.com/p/1527636/"
license=('GPL')
depends=(
    'libksysguard'
    'plasma-workspace'
)
optdepends=()
makedepends=(
    'extra-cmake-modules'
    'kdelibs4support'
)
source=("https://github.com/orblazer/${_upstream_name}/archive/v${_pkgver}.tar.gz")
sha256sums=('d4c163629801a9ae4b93b359d696f531d830d1869102d316bd574361024ff849')

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
