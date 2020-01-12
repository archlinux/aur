# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-video-siliconmotion
pkgver=1.7.9
pkgrel=1
pkgdesc="X.org siliconmotion video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc'
            'SKIP')
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C') # Julien Cristau <julien.cristau@ens-lyon.org>


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
