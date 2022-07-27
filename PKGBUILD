#Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com > 

pkgname=xf86-video-cirrus
pkgver=1.6.0
pkgrel=1
pkgdesc="Cirrus Logic video driver for the Xorg X server"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2')
conflicts=('xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6448c25dabfa87153904cfa8aa21568d09022517d8f851dc9a360b3e1187f146')

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

