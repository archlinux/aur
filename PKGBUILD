# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-mach64
pkgver=6.10.0
pkgrel=1
pkgdesc="X.org mach64 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION>=23' 'X-ABI-VIDEODRV_VERSION<26')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=26')
optdepends=('mach64-dri: DRI1 support from community repo'
            'mach64drm: Mach64 DRM module')
groups=('xorg-drivers')
options=('!emptydirs' '!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.xz)
sha256sums=('d6b96b47a27cd2dc6dea612f5dc51fcc1a8561d5ad1d48d04ec2d47751222724')

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
