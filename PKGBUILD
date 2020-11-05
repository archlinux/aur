pkgname=dpdk
pkgver=20.08
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=(x86_64 i686)
url='http://dpdk.org'
license=(BSD)
options=(staticlibs)
depends=(numactl libelf libpcap libbpf libbsd dtc jansson)
makedepends=(linux-headers python-pyelftools meson ninja)
checkdepends=()
source=(http://fast.dpdk.org/rel/dpdk-$pkgver.tar.xz)
sha1sums=('01ef6063fd4b4ed737513d79f095e0b4ee876a3a')

build() {
  cd dpdk-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd dpdk-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
