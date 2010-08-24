# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.2.904
pkgrel=4
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc' 'unichrome-dri')
makedepends=('xorg-server-devel' 'libdrm' 'xf86driproto' 'mesa' 'libxvmc')
replaces=('openchrome' 'xf86-video-via')
options=('!libtool' 'force' '!makeflags')
conflicts=('xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'xorg-server<1.9.0')
source=(http://xorg.freedesktop.org/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2
        drm_stdint.patch
        svn-r839.patch
        LICENSE.txt)
md5sums=('f2481d98ef54febf5bffbb88a2a2426d'
         'bc516400ffc3df5d0dfe604f6245dd32'
         '5aed4aa44dd5a6d3e2da9baad73ac0ab'
         'addb3cf2671f4cf7e91156952de1627f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/svn-r839.patch"
  patch -Np0 -i "${srcdir}/drm_stdint.patch"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
