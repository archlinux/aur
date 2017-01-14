# $Id: PKGBUILD 281753 2016-11-21 14:51:38Z lcarlier $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer:Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-nv
pkgver=2.1.20
pkgrel=8
pkgdesc="X.org nv video driver"
arch=('i686' 'x86_64')
license=('custom')
url="https://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
groups=('xorg-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2 git-fixes.patch)
sha256sums=('8395f65501f16f9cbaae8f598b02c6f18e78f4d3d30a08cb8d547dc2e00c10bf'
            'f4deb2b8f8acbbe901a25a8e9e0f29de80a63b62189ea00c95143be69f5fa87b')

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
