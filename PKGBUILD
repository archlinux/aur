pkgname=dpdk
pkgver=21.05
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
sha1sums=('f0e50aff9bf7705307d65fe0e1e624a2568293e6')

build() {
  cd dpdk-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd dpdk-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
