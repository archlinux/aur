# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=13.2.1
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('mesa')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21')
groups=('xorg-drivers')
options=('!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('e2f7f7101fba7f53b268e7a25908babbf155b3984fb5268b3d244eb6c11bf62b'
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
