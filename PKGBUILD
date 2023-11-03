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
sha512sums=('001b1276fd078ac8cb2d6523e02262c27a14c3b9c348559497add4c41ee357df4665375452b551fa120b30d8d30bfa38d9846f32075af78b135f2f59a7a23dc0')

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
