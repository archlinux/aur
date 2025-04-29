# Maintainer: robertfoster

pkgname=ndpi
pkgver=4.14 # renovate: datasource=github-tags depName=ntop/nDPI
pkgrel=2
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
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/nDPI-${pkgver}"
  make DESTDIR="${pkgdir}" install
#  ln -sf /usr/include/ndpi \
#    "${pkgdir}/usr/include/libndpi"
}

sha256sums=('954135ee14ad6bd74a78a10db560b534b8f2083ad0615f5c1a2c376fff0301e0')
