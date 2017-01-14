# $Id: PKGBUILD 281743 2016-11-21 14:10:31Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-video-s3virge
pkgver=1.10.7
pkgrel=3
pkgdesc="X.org S3 Virge video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('5dbe68de05483f902fdc48e97ce8d9fdd1d2ade14cb53c0c3642f0259f65a4da'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

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
