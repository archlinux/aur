# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contirbutor: Eric Bélanger <eric@archlinux.org>

pkgname=xfig
pkgver=3.2.9
pkgrel=1
pkgdesc="An interactive drawing tool"
arch=('x86_64' 'i686')
url="http://mcj.sourceforge.net/"
license=('custom')
depends=('libjpeg' 'xaw3d' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'libpng' 'libxpm' 'ghostscript' 'libxft')
optdepends=('fig2dev: to use the frontend to convert fig files')
makedepends=('fig2dev' 'libxaw')
options=('!makeflags' '!emptydirs')
source=(http://downloads.sourceforge.net/mcj/${pkgname}-${pkgver}.tar.xz
	xfig.patch LICENSE)
sha1sums=('c88ff9ddb9da4ce5b8ac19deb31cb4efa3a363e9'
          '20fbdeb74f5405f729033e74a368ce5b88ba902f'
          '31edf4cfab708820ea3f114d095dfef5aa88e5aa')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np2 -b -z .orig -i ../xfig.patch
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
