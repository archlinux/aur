# $Id: PKGBUILD 281783 2016-11-21 19:12:08Z lcarlier $
# Maintainer:Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-i128
pkgver=1.3.6
pkgrel=8
pkgdesc="X.org Number 9 I128 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 git-fix.diff)
sha256sums=('f8827e4c988f90cf5a677554b30d61f0a07eb86d872478751cdc94dc17452b9c'
            '3805461dd71ff6675fd08afd5c21a230e7f36d6cda6830adac38ceee36d96f4b')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/git-fix.diff
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
