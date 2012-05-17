# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.2.906
pkgrel=1
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc')
makedepends=('xorg-server-devel>=1.11.99.902' 'libx11' 'xf86driproto' 'mesa') #'glproto' 'libgl')
replaces=('openchrome' 'xf86-video-via')
options=('!libtool' '!emptydirs' '!makeflags')
conflicts=('xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'xorg-server<1.11.99.902' 'unichrome-dri')
source=(http://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('1c49bf722326442393288db490ff48d437e337f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr # --disable-dri
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
