# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contirbutor: Eric Bélanger <eric@archlinux.org>

pkgname=xfig
pkgver=3.2.8
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
	xfig-aspell.patch xfig-3.2.5-color-resources.patch
        LICENSE)
sha1sums=('93229765f9e764f76e10585309a6c690554cec64'
          'a57fcc3c8396d58b19061f9cdd93beea728e38e5'
          'dd41e0a007bb74b74e1af50b6b04aa6aec61ab22'
          '31edf4cfab708820ea3f114d095dfef5aa88e5aa')

prepare() {
  cd ${pkgname}-${pkgver}
   patch -p1 -i "${srcdir}/xfig-aspell.patch"
   patch -p1 -i "${srcdir}/xfig-3.2.5-color-resources.patch"
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
