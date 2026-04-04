pkgname=dpdk-lts
pkgver=26.03
pkgrel=3
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=($CARCH)
url='http://dpdk.org'
license=(
  'BSD-3-Clause AND GPL-2.0-only'
)
provides=(${pkgname%-lts})
conflicts=(${pkgname%-lts})
options=()
depends=(
  sh
  dtc
  glibc
  jansson
  libarchive
  libbsd
  libbpf
  libelf
  libpcap
  libxdp
  isa-l
  numactl
  rdma-core
  openssl
  python
  python-scapy
  python-pefile
  python-pkg_resources
  python-pyelftools
  zlib
)
makedepends=(
  doxygen
  cmake
  ninja
  meson
  man-db
  python-sphinx

)
checkdepends=()
source=(
  "http://fast.dpdk.org/rel/dpdk-$pkgver.tar.xz"
)
sha256sums=('84989202bbe0fbaeeb62f8fdc63f691880ac0b66cd0dc64c167843c59db29d2c')

prepare() {
  meson subprojects download --sourcedir="${srcdir}/dpdk-$pkgver"
}

build() {
  cd "${srcdir}/dpdk-$pkgver"
  arch-meson build
  ninja -C build
}

# check() {
#   cd dpdk-$pkgver
#   # tests fail
#   make test T=x86_64-native-linuxapp-gcc
# }

package() {
  DESTDIR="${pkgdir}" ninja -C ${srcdir}/dpdk-$pkgver/build install
}
