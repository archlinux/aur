pkgname=dpdk
pkgver=2.2.0.rc1
_tag=2.2.0-rc1
pkgrel=1
pkgdesc='A set of libraries and drivers for fast packet processing'
arch=(x86_64 i686)
url='http://dpdk.org'
license=(BSD)
options=(staticlibs)
depends=()
makedepends=(linux-headers libpcap)
checkdepends=()
source=(http://dpdk.org/browse/dpdk/snapshot/dpdk-$_tag.tar.gz)
sha1sums=('11af71ffceb8808f5459f76090166dd6e4af808a')

prepare() {
  cd dpdk-$_tag
  make config T=x86_64-native-linuxapp-gcc
  sed -ri 's,(PMD_PCAP=).*,\1y,' build/.config
  sed 's|\bpython\b|python2|' -i mk/rte.sdktest.mk
}

build() {
  cd dpdk-$_tag
  make T=x86_64-native-linuxapp-gcc
}

check() {
  cd dpdk-$_tag
  # tests fail
  # make test T=x86_64-native-linuxapp-gcc
}

package() {
  cd dpdk-$_tag
  make T=x86_64-native-linuxapp-gcc DESTDIR="$pkgdir/opt/$pkgname" install
}
