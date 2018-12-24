# Package maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.4.0
pkgrel=2
pkgdesc="Plasmoid for ambient noise reproduction"
arch=('any')
url="https://github.com/m-pilia/plasma-applet-ambientnoise"
license=('GPL')
depends=('plasma-workspace')
optdepends=('anoise-media: noise files and icons'
            'anoise-community-extension1: noise files and icons'
            'anoise-community-extension2: noise files and icons'
            'anoise-community-extension3: noise files and icons'
            'anoise-community-extension4: noise files and icons'
            'anoise-community-extension5: noise files and icons')
makedepends=('extra-cmake-modules'
             'git')
source=(https://github.com/m-pilia/${_upstream_name}/archive/${pkgver}.tar.gz)
sha512sums=('bc3de029fda7344bcfdd3e5d28b38d7f61a4c896905f9514303759203586d9020c72128a6b16a39078af017d6b3cd416b310bf43529a9bb3db7d1d0d08f74a98')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_upstream_name}-${pkgver} -DCMAKE_INSTALL_PREFIX="`kf5-config --prefix`" \
                                       -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
  rm -f "$pkgdir/usr/share/icons/breeze/icon-theme.cache" || :
}
