# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.3.3
pkgrel=2
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc' 'systemd')
optdepends=('unichrome-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15' 'xf86-video-via' 'xf86-video-unichrome' 'openchrome')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers' 'xorg')
options=('!emptydirs' '!makeflags')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('1f7b23d4ed53417eda5c6730486b36812f469295')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
