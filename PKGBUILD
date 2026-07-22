pkgname=dpdk-lts
pkgver=26.07
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
  dtc
  glibc
  jansson
  libarchive
  libatomic
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
sha256sums=('7141a8b5bad9d7d965483ac0d75317ac0c21dcee1d13d373693c655f9e3fabe6')

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
