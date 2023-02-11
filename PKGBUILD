# Maintainer: robertfoster

pkgname=ndpi
pkgver=4.6
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
conflicts=('ndpi-svn')
depends=('libcap')
makedepends=('json-c' 'libmaxminddb' 'libpcap' 'numactl' 'pcre2' 'rrdtool')
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
#  ln -sf /usr/include/ndpi \
#    "${pkgdir}/usr/include/libndpi"
}

sha256sums=('6f307e23ab11b2b9e84a696120810e27a854072576a49783ff84fd37a1d7411b')
