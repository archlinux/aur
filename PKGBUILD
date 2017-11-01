# Package maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.3.1
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
sha512sums=('b345d2f67150dacbd3b88b8519941da61dc38d112969258d6278d6652fd9b84bd43be87f413f2efae5907ec4a68a02d2dfaefccffece5ca674deec7ec3b27245')

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
