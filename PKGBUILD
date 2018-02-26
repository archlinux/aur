# Maintainer: Vi0L0 <vi0l093@gmai.com>
# Previous Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libxfont
pkgver=1.5.4
pkgrel=1
pkgdesc="X11 font rasterisation library"
arch=('x86_64' 'armv6h')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('freetype2' 'libfontenc' 'xproto' 'fontsproto')
makedepends=('xorg-util-macros' 'xtrans')
source=(${url}/archive/individual/lib/libXfont-${pkgver}.tar.bz2)
#sha256sums=('0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586bac9c4e'
#            'SKIP')
sha256sums=('1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242')
#validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # Keith Packard <keithp@keithp.com>
#validpgpkeys+=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # "Adam Jackson <ajax@nwnk.net>"
#validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # "Matthieu Herrb <matthieu.herrb@laas.fr>"

build() {
  cd "${srcdir}/libXfont-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "${srcdir}/libXfont-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
