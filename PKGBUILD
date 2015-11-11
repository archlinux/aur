# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.1.0
pkgrel=3
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'mesa>=10.0')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('3c1d244e4b1b77e92126957965cdc9fb82de4c215c0706a3a8aaff6939e4a0cc'
            'SKIP')
validpgpkeys=('90D027AEAF33CBABC140735BC1F5D3CDF5176580') #  Thomas Hellstrom (VMware) <thellstrom@vmware.com>

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
