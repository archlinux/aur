# $Id: PKGBUILD 281724 2016-11-21 12:04:11Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-tseng
pkgver=1.2.5
pkgrel=8
pkgdesc="X.org tseng video driver"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 git-fixes.patch)
sha256sums=('c06dc5205f627e5afc795ecfa75e18d2d1db4e1f1f195fd017dad60854407819'
            '8a337e2bab9a5ee7ba15dde6665abcfa9559d769074873cb2a85cc86716bd5da')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/git-fixes.patch
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
