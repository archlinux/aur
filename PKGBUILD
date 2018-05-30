# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-mach64
pkgver=6.9.6
pkgrel=2
pkgdesc="X.org mach64 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION>=23' 'X-ABI-VIDEODRV_VERSION<25')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=25')
optdepends=('mach64-dri: DRI1 support from community repo'
            'mach64drm: Mach64 DRM module')
groups=('xorg-drivers')
options=('!emptydirs' '!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('7a0707c71bb522430f83bb5e9d9ee697e661e35534a3a2d10834f86b327a3c9c')

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
