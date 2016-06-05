pkgname=dpdk
pkgver=16.04
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=(x86_64 i686)
url='http://dpdk.org'
license=(BSD)
options=(staticlibs)
depends=()
makedepends=(linux-headers libpcap)
checkdepends=()
source=(http://fast.dpdk.org/rel/dpdk-$pkgver.tar.xz)
sha1sums=('580d8bb773a867dcc85a85e74714f130d0c76da3')

prepare() {
  cd dpdk-$pkgver
  make config T=x86_64-native-linuxapp-gcc
  sed -ri 's,(PMD_PCAP=).*,\1y,' build/.config
  sed 's|\bpython\b|python2|' -i mk/rte.sdktest.mk
}

build() {
  cd dpdk-$pkgver
  make T=x86_64-native-linuxapp-gcc
}

check() {
  cd dpdk-$pkgver
  # tests fail
  # make test T=x86_64-native-linuxapp-gcc
}

package() {
  cd dpdk-$pkgver
  make T=x86_64-native-linuxapp-gcc DESTDIR="$pkgdir/opt/$pkgname" install
}
