# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=celestia
pkgver=1.6.4
pkgrel=1
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL)
url="https://${pkgname}project.space"
depends=('gtk2' 'libtheora' 'lua53' 'gtkglext' 'freeglut' 'libxmu' 'glu' 'libjpeg-turbo' 'mesa')
options=('!makeflags')
source=(https://github.com/CelestiaProject/Celestia/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('58f5e55bcb193f89202663a2af8dbb920fa5bd4e893c0ec1884488b238d459d91ffc750b6b7a71653bdbe9e79e88d785020f9b189df8fad750bea39bf995a91c')

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
