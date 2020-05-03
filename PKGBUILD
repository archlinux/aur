# $Id: PKGBUILD 281747 2016-11-21 14:27:42Z lcarlier $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-rendition
pkgver=4.2.7
pkgrel=1
pkgdesc="X.org Rendition video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('9511c6595c9d489a022635bd8d91149de0cb3cbf9034739452ca5b9b5d63f87b'
            'SKIP')
validpgpkeys=('DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3') # Adam Jackson <ajax@nwnk.net>

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
