# Maintainer: Harms <thotro@lyse.net>

pkgname=libtheora-ptalarbvorm
pkgver=1.2.0alpha1
pkgrel=2
pkgdesc="An open video codec developed by the Xiph.org - ptalarbvorm version [unstable]."
arch=('i686' 'x86_64')
depends=('libogg')
makedepends=('libvorbis')
provides=('libtheora=${pkgver}')
conflicts=('libtheora')
url="http://www.theora.org/"
license=('custom')
options=(!libtool)
source=('http://downloads.xiph.org/releases/theora/libtheora-1.2.0alpha1.tar.xz' 'libtheora-1.2.0alpha1.patch')
md5sums=('57de23dcd8bcf2ced4458924b01d2f51' '68a29b838323b6eadd69b26337fbc55c')

build() {
  cd "${srcdir}/libtheora-${pkgver}"
  patch -Np1 -i "${srcdir}/libtheora-${pkgver}.patch"
  ./autogen.sh
  ./configure --prefix=/usr --enable-shared --disable-static --disable-examples
  make
}
package() {
  cd "${srcdir}/libtheora-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
  
  # Install the documents.
  install -m755 -d "${pkgdir}/usr/share/licenses/libtheora"
  install -m644 LICENSE COPYING "${pkgdir}/usr/share/licenses/libtheora/"
}
