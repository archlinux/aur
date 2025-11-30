pkgname=dpdk-lts
pkgver=25.11
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
  dlpack
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
sha256sums=('52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526')

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
