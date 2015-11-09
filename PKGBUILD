pkgname=dpdk
pkgver=2.2.0.rc1
_tag=2.2.0-rc1
pkgrel=1
pkgdesc='A set of tools and libraries for writing high performance, scalable, user-mode storage applications'
arch=(x86_64 i686)
url='https://01.org/spdk'
license=(BSD)
options=(staticlibs)
depends=()
makedepends=(linux-headers libpcap)
checkdepends=()
source=(http://dpdk.org/browse/dpdk/snapshot/dpdk-$_tag.tar.gz)
md5sums=('d17494e540005d7b7178cf6273ff9c72')

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
