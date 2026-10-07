# Maintainer: robertfoster

pkgname=ndpi
pkgver=6.0 # renovate: datasource=github-tags depName=ntop/nDPI
pkgrel=2
pkgdesc="Open and Extensible Deep Packet Inspection Library"
arch=('x86_64' 'aarch64')
url="https://www.ntop.org/products/deep-packet-inspection/ndpi/"
license=('LGPL-3.0-or-later')
provides=('libndpi.so')
conflicts=('ndpi-svn' 'ndpi-git')
depends=('glibc' 'libmaxminddb' 'libpcap' 'pcre2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ntop/nDPI/archive/${pkgver}.tar.gz")

prepare() {
  cd "nDPI-${pkgver}"
  ./autogen.sh
}

build() {
  cd "nDPI-${pkgver}"
  ./configure \
    --prefix=/usr \
    --with-pcre2 \
    --with-maxminddb
  make
}

package() {
  cd "nDPI-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('21fc40cab5505942c0b21d9bbaf73e9adf8162ddfe782e4cd072cab855a2eda9')
