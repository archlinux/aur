# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
_base=Celestia
pkgname=${_base,,}
pkgver=1.6.4
pkgrel=3
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://${pkgname}project.space"
depends=(gtk2 libtheora lua gtkglext freeglut libxmu glu libjpeg-turbo mesa)
options=('!makeflags')
source=(https://github.com/${_base}Project/${_base}/archive/${pkgver}/${_base}-${pkgver}.tar.gz
  m4.patch::https://github.com/${_base}Project/${_base}/pull/2173.patch)
sha512sums=('58f5e55bcb193f89202663a2af8dbb920fa5bd4e893c0ec1884488b238d459d91ffc750b6b7a71653bdbe9e79e88d785020f9b189df8fad750bea39bf995a91c'
            'a32c32d7b4b2853ff85f47e6c8368f2313b5515b49ec07cb525e15c6cecf88d71dc92998a82510852d6f8699470386a52986d1da90450652f1f17d6988a86491')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../m4.patch
}

build() {
  cd ${_base}-${pkgver}
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
  cd ${_base}-${pkgver}
  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
