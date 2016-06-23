# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.4.902
pkgrel=1
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.freedesktop.org/wiki/Openchrome/"
depends=('libdrm' 'libxvmc' 'systemd')
optdepends=('unichrome-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=20' 'git')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<20' 'X-ABI-VIDEODRV_VERSION>=21'
           'xf86-video-via' 'xf86-video-unichrome' 'openchrome')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs' '!makeflags')
source=(#http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2 git-fixes.patch
        # there's no release tarball
        git://anongit.freedesktop.org/openchrome/xf86-video-openchrome#commit=54de6f9)
md5sums=('SKIP')

prepare() {
  cd ${pkgname} #-${pkgver}
  autoreconf -vfi
}

build() {
  cd ${pkgname} #-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname} #-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
