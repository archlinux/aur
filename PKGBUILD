# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-r128
pkgver=6.12.0
pkgrel=2
pkgdesc="X.org ati Rage128 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2')
optdepends=('r128-dri: DRI1 support from community repo')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2) #{,.sig})
sha256sums=('801c86882cbd2bbb3084d471dcc5cfee2c1754dcbfb4dc446676d58a6bd9e057')
            #'SKIP')
#validpgpkeys=('6EA3F3F3B9082632A9CBE931D53A0445B47A0DAB') # Connor Behan <connor.behan@gmail.com>


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
