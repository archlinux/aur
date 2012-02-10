# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.2.905
pkgrel=1
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc' 'unichrome-dri')
makedepends=('xorg-server-devel>=1.11.99.902' 'libdrm' 'xf86driproto' 'mesa' 'libxvmc' 'glproto')
replaces=('openchrome' 'xf86-video-via')
options=('!libtool' '!emptydirs') # '!makeflags')
conflicts=('xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'xorg-server<1.11.99.902')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('51871431a4a9204ab8ec79335c0cc041')

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
