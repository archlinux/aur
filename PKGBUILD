# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.3.3
pkgrel=4
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.freedesktop.org/wiki/Openchrome/"
depends=('libdrm' 'libxvmc' 'systemd')
optdepends=('unichrome-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=18')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<18' 'X-ABI-VIDEODRV_VERSION>=19'
           'xf86-video-via' 'xf86-video-unichrome' 'openchrome')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs' '!makeflags')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('1f7b23d4ed53417eda5c6730486b36812f469295')

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
