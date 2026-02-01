# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.7.7
pkgrel=1
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('cmake')
source=(https://github.com/SIPp/${pkgname}/releases/download/v${pkgver}/sipp-${pkgver}.tar.gz)
sha256sums=('e55b15f567760e9febeef366a1ab51a5239d197a132ce931b78c826d22d31e69')

build() {
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_SSL=ON \
    -DUSE_PCAP=ON \
    -DUSE_SCTP=ON \
    .
  make sipp
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
