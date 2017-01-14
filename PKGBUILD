# $Id: PKGBUILD 281737 2016-11-21 13:46:51Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-sis
pkgver=0.10.8
pkgrel=3
pkgdesc="X.org SiS video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'xf86dgaproto')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
optdepends=('sis-dri: DRI1 support from community repo')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        git-fixes.patch)
sha256sums=('c8f3f2577f69334dfcc4bf96477dce45161170555f3abdfa105599e61bc7d3fe'
            'b3cbb937a94c5e0ea21e05005238b247ee146ba8640eda7bfbe8b382b25dde7b')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/git-fixes.patch
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
