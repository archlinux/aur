# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.0.0
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri' 'mesa')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=13' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.13.0' 'X-ABI-VIDEODRV_VERSION<13' 'X-ABI-VIDEODRV_VERSION>=14')
groups=('xorg-drivers' 'xorg')
options=('!libtool' '!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('44919ecd88654f2ab40a1732b5ea6a1dbd1c696b4b0748e68e8b5f1a3486bca6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
