pkgname=dpdk-lts
pkgver=25.07
pkgrel=1
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
  bpf
  dtc
  gcc-libs
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
  python-scapy
  python-pyelftools
  zlib
  #AUR
  dlpack
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
sha256sums=('6886cbedc350bb8cbef347d10367d6259e36435627fbb27d578adbdc0d3b410d')

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
