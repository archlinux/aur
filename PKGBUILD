# $Id: PKGBUILD 281801 2016-11-22 05:57:38Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-apm
pkgver=1.3.0
pkgrel=1
pkgdesc="X.org Alliance ProMotion video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 git-fix.diff)
sha256sums=('808189b9a933fcad1761cb9cd498f9267dfbacee1059859282712e8598c3dc7e'
            'be06cce5eb0b8eb070321e293f5cd9b7aa947d920d23cc962f7121191ba4180b')

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
