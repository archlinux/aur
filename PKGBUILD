# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contirbutor: Eric Bélanger <eric@archlinux.org>

pkgname=xfig
pkgver=3.2.8b
pkgrel=1
pkgdesc="An interactive drawing tool"
arch=('x86_64' 'i686')
url="http://mcj.sourceforge.net/"
license=('custom')
depends=('libjpeg' 'xaw3d' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'libpng' 'libxpm' 'ghostscript')
optdepends=('fig2dev: to use the frontend to convert fig files')
makedepends=('fig2dev' 'libxaw')
options=('!makeflags' '!emptydirs')
source=(http://downloads.sourceforge.net/mcj/${pkgname}-${pkgver}.tar.xz
	xfig.patch LICENSE)
sha1sums=('8cbec8fdbcbdb69a2d50b2adff16e1ea1431fc0a'
          '683ec9bb1b6e40a8e13b3c2da037bb5fb5f8fcd5'
          '31edf4cfab708820ea3f114d095dfef5aa88e5aa')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np2 -i ../xfig.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
