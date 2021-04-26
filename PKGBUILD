# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="swcdb"
_sub_name="thriftbroker"

pkgname=${_group_name}-${_sub_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="The SWC-DB ThriftBroker Application"
arch=("x86_64")

groups=($_group_name)
provides=(
  swcdbThriftBroker
)

url="https://www.swcdb.org"
license=('GPLv3')


depends=(
  'swcdb-lib-fs'
  'swcdb-lib'
  'swcdb-lib-thrift'
)
makedepends=(
  'git'
  'cmake'
  'make'
  'gcc'
  'boost'
  'asio'
  'swcdb-lib-fs'
  'swcdb-lib'
  'swcdb-lib-thrift'
)
optdepends=(
  'swcdb-lib-fs-broker'
  'swcdb-lib-fs-local'
  'swcdb-lib-fs-ceph'
  'swcdb-lib-fs-hadoop'
  'swcdb-lib-fs-hadoop-jvm'
)

conflicts=()
replaces=()
backup=()
options=()
install=README.md
changelog=


source=(
  $pkgname-$pkgver-source::git+https://github.com/kashirin-alex/swc-db.git#tag=v$pkgver
)
sha256sums=('SKIP')


build() {
  mkdir -p $pkgname-$pkgver-build;
  cd $pkgname-$pkgver-build;

  cmake ../$pkgname-$pkgver-source \
    -DO_LEVEL=3 -DSWC_BUILD_PKG=${_sub_name} \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    -DCMAKE_BUILD_TYPE=Release;
  make -j$((`grep -c processor < /proc/cpuinfo || echo 1`));
}


package() {
  cd $pkgname-$pkgver-build;
  make install;
}
