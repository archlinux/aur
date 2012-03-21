# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=12.0.2
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri')
makedepends=('xorg-server-devel>=1.11.99.903' 'libx11' 'libxext')
conflicts=('xorg-server<1.11.99.903')
groups=('xorg-drivers' 'xorg')
options=('!libtool' '!emptydirs')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('efa47f365d88da245804a9934719ff860ed04f95')

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
