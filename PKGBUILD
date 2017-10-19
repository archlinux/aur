# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.3
pkgrel=1
pkgdesc="Plasmoid for ambient noise reproduction"
arch=('any')
url="https://github.com/m-pilia/plasma-applet-ambientnoise"
license=('GPL')
depends=('plasma-workspace')
optdepends=('anoise-media: noise files and icons'
            'anoise-community-extension1: noise files and icons'
            'anoise-community-extension2: noise files and icons'
            'anoise-community-extension3: noise files and icons')
makedepends=('extra-cmake-modules'
             'git')
source=(https://github.com/m-pilia/${_upstream_name}/archive/${pkgver}.tar.gz)
sha512sums=('201e0fa809dfce4ef7b605801ac5c7740cd6dcdf9f249e2e6b6366756d44be120a4013bd6c95579eeca30a4105aca9978efc218b90c7f9bb8234507f4448ac82')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_upstream_name}-${pkgver} -DCMAKE_INSTALL_PREFIX="${pkgdir}`kf5-config --prefix`" \
                                       -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install
  rm -f "$pkgdir/usr/share/icons/breeze/icon-theme.cache" || echo
}
