# Contributor:Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-i128
pkgver=1.4.0
pkgrel=1
pkgdesc="X.org Number 9 I128 video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('8f2c0a6bf5a169dad3fc07c6dd4537b492d0e44489e4a1297311e617c3bed0ea'
            'SKIP')
validpgpkeys=('C922784178BFFDB0')


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
