# Maintainer: robertfoster

pkgname=ndpi
pkgver=4.12 # renovate: datasource=github-tags depName=ntop/nDPI
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

sha256sums=('28b0029877bbc970a8acc924664541c71e76e7a45e3761d5d0ddf3e695b6878c')
