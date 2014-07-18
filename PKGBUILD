# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.0.2
pkgrel=2
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri' 'mesa>=10.0')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=18')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<18' 'X-ABI-VIDEODRV_VERSION>=19')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('c8ba3d2cead3620dba2cbf5defb7f1759b2b96f4fe209f4bf6976832b6763c54')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
