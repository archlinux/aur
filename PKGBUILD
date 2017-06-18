# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.2
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
sha512sums=('f0ba6f97ac68a02af303b33533744cda2884459b47f26686df3fdc4394b99c35958c5e0d3ace04f21a471dcd0e0b832eb2aaf7f12adbf53f20525e42119711dc')

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
