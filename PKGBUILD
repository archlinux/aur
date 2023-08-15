# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=celestia
pkgver=1.6.3
pkgrel=1
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL)
url="https://${pkgname}project.space"
depends=('gtk2' 'libtheora' 'lua53' 'gtkglext' 'freeglut' 'libxmu' 'glu' 'libjpeg-turbo' 'mesa')
options=('!makeflags')
source=(https://github.com/CelestiaProject/Celestia/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('bec5b34e6452e9930dc174ff2214311935c12ab9a006b01137d3fc0f5ca803a514ef8e702a824d6e4eb49a2bfb2b6f42c7f6f383eca193d15876f88964bb858c')

build() {
  cd Celestia-${pkgver}
  autoreconf -vi
  ./configure --prefix=/usr \
    --with-lua=/usr \
    --datadir=/usr/share \
    --with-gtk \
    --disable-rpath \
    --with-lua
  make
}

package() {
  cd Celestia-${pkgver}
  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
