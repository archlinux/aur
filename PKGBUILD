# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=12.0.2
pkgrel=2
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri' 'mesa')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=13' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.13.0' 'X-ABI-VIDEODRV_VERSION<13' 'X-ABI-VIDEODRV_VERSION>=14')
groups=('xorg-drivers' 'xorg')
options=('!libtool' '!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 git_fixes.diff)
sha1sums=('efa47f365d88da245804a9934719ff860ed04f95'
          'ad475b37e2614f365533a40da0fb5b9e2709e3c6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/git_fixes.diff
  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
