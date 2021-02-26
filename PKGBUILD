pkgname=dpdk
pkgver=21.02
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
sha1sums=('88ed3a698387caa917a0227bcb9eca2a838bf55d')

build() {
  cd dpdk-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd dpdk-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
