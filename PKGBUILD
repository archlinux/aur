# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.6.1
pkgrel=2
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('cmake')
source=(https://github.com/SIPp/${pkgname}/releases/download/v${pkgver}/sipp-${pkgver}.tar.gz)
sha256sums=('6a560e83aff982f331ddbcadfb3bd530c5896cd5b757dd6eb682133cc860ecb1')

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
