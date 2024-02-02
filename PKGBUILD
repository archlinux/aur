# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-r128
pkgver=6.12.1
pkgrel=1
pkgdesc="X.org ati Rage128 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2')
optdepends=('r128-dri: DRI1 support from mesa-7.11')
groups=('xorg-drivers')
source=(https://gitlab.freedesktop.org/xorg/driver/$pkgname/-/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.bz2)
sha256sums=('9c2c92f111fa07d0d261d1a2650b73627e66ad7c8840c4b3a12a9c4754955407')
#validpgpkeys=('6EA3F3F3B9082632A9CBE931D53A0445B47A0DAB') # Connor Behan <connor.behan@gmail.com>


build() {
  cd ${pkgname}-${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
