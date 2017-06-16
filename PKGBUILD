# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.1
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
sha512sums=('c7f86a9d0fe77bc7e9a6f333427f49ccf74766aa7cca5bab126ca05134b3e8de797a518f091db0fade706d96196f7de6449af14c3fd0ae27aeffb3663dc5d6fe')

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
