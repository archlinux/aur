# Maintainer: robertfoster

pkgname=ndpi
pkgver=4.2
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
options=()
source=("https://github.com/ntop/nDPI/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/nDPI-${pkgver}"
  unset CPPFLAGS
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-pic \
    --includedir=/usr/include \
    --libdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/nDPI-${pkgver}"
  make DESTDIR="${pkgdir}" install
  ln -sf /usr/include/ndpi \
    "${pkgdir}/usr/include/libndpi"
}

sha256sums=('e54ce8fe13adc5d747be7553513657fae78f796e0bd459e122c280cc06ce4daf')
