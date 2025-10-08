# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.7.5
pkgrel=1
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('cmake')
source=(https://github.com/SIPp/${pkgname}/releases/download/v${pkgver}/sipp-${pkgver}.tar.gz
        cmake-minimum-version.patch)
sha256sums=('0d202f562fcc9f5aee578d5e9383fb321a69e1b04f1785757eccfba2fc5eeefe'
            '30bf64077b493f888a0a67c6ef0f294f45fcc55b2d6918da5e5384724ed657e3')

build() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ../cmake-minimum-version.patch
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
