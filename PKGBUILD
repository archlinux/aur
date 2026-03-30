# Maintainer: Ondrej Dohnal <dohnal@douball.eu>

_pkgname=ipfixprobe
pkgname=${_pkgname}-git
pkgver=v5.5.0
pkgrel=1
pkgdesc="IPFIX flow exporter with DPDK support capable of bi-directional flows, per-packet-information statistics, and extensibility via processing plugins (e.g., for application layer parsers)."
arch=('any')
url="https://github.com/CESNET/ipfixprobe"
license=('BSD-3-Clause')
depends=('libunwind' 'lz4' 'openssl' 'fuse3' 'libatomic' 'libpcap')
makedepends=('cmake' 'make' 'gcc' 'pkg-config' 'libpcap' 'libunwind' 'lz4' 'openssl' 'fuse3' 'libatomic' 'libpcap')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+${url}#tag=${pkgver}")
sha256sums=("4cf71748012ac6976159f963eebef36a3cc487af668a3d0e5a5f61dc7248f77b")

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build 
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir -DENABLE_INPUT_PCAP=ON -DENABLE_RPMBUILD=OFF
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make install
}
