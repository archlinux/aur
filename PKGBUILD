# $Id: PKGBUILD 281799 2016-11-22 05:54:49Z lcarlier $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-ark
pkgver=0.7.5
pkgrel=8
pkgdesc="X.org ark video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 build-fix.diff)
sha256sums=('c690e046f34a393aac1c8d9616b4790e93cda60a460b00b9597d322175dbe51e'
            'ab694ebc0820d75b7cbf58920ce8b10291f245a5f1ae82542cfa63e5765660dc')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/build-fix.diff
}

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
