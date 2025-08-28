# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.7.1
pkgrel=1
pkgdesc="A free open source test tool and traffic generator for the SIP protocol"
arch=('i686' 'x86_64')
url="http://github.com/sipp"
license=('GPL2')
depends=('openssl' 'libpcap' 'gsl' 'lksctp-tools')
makedepends=('cmake')
source=(https://github.com/SIPp/${pkgname}/releases/download/v${pkgver}/sipp-${pkgver}.tar.gz
        cmake-minimum-version.patch)
sha256sums=('7d285de2158bbdf3d04c5a45b5638a8b6c1e160f5c1d5f6e9775fbda910a4c0b'
            '52c84acfabe1019edd3ba58c0247e00ef3f6f5bae55d2d08da66479f3c673df8')

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
