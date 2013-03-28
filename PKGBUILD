# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.3.2
pkgrel=1
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc' 'systemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15' 'xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'unichrome-dri')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers' 'xorg')
options=('!libtool' '!emptydirs' '!makeflags')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('e5be9a8200410b3e3e66349bab4c8acd1ead4402')

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
