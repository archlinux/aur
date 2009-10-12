# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.2.904
pkgrel=1
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('unichrome-dri>=7.6')
makedepends=('pkgconfig' 'xorg-server>=1.7.0' 'xf86driproto' 'xorg-util-macros' 'libxvmc' 'glproto' 'mesa>=7.6' 'inputproto')
replaces=('openchrome' 'xf86-video-via')
options=('!libtool' 'force' '!makeflags')
conflicts=('xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'xorg-server<1.7.0')
source=(http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        LICENSE.txt)
md5sums=('f2481d98ef54febf5bffbb88a2a2426d'
         'addb3cf2671f4cf7e91156952de1627f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
}
