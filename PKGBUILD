# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Aleshus <aleshusi@gmail.com>

pkgname=sipp
pkgver=3.5.1
pkgrel=2
pkgdesc="A free Open Source test tool / traffic generator for the SIP protocol."
arch=('i686' 'x86_64')
url="http://sipp.sourceforge.net/"
license=('GPL')
depends=('openssl' 'libpcap' 'lksctp-tools')
source=(https://github.com/SIPp/${pkgname}/releases/download/v${pkgver}/sipp-${pkgver}.tar.gz)
sha256sums=('56421ba7b43b67e9b04e21894b726502a82a6149fc86ba06df33dfc7252a1891')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/SSL_library_init/SSL_CTX_new/' configure.ac
  sed -i 's/CRYPTO_num_locks/CRYPTO_free/' configure.ac
  sed -i 's/TLSv1_method/TLS_method/' src/socket.cpp
  ./build.sh --with-pcap --with-sctp --with-openssl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
