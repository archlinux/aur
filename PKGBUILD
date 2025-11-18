# Maintainer: robertfoster

pkgname=ndpi
pkgver=5.0 # renovate: datasource=github-tags depName=ntop/nDPI
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

sha256sums=('8b0d3dc0c8a6a68578e09a18c922021ef6458d4aca1c7a20ce04efc267aa9ea5')
