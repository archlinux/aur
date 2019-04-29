# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=v4l2ucp
pkgver=2.0.2
pkgrel=5
pkgdesc="A universal control panel for Video for Linux Two (V4L2) devices"
arch=('x86_64')
url="http://v4l2ucp.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'v4l-utils')
optdepends=('mplayer: video preview')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('4c1e4e9fa5f8388a179632918edda2f5b84737370bf6eb67fe4b05215f0fc67f59df4749d7e86aa4da288da0eedf646978e0c84332054ec561a7c814b079fefc')

prepare() {
  cd "${pkgname}-${pkgver}"
  # use videodev2.h header
  sed -i 's/videodev/&2/' src/v4l2ctrl.c
  mkdir -vp build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
