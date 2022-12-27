# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-casd
pkgver=0.0.63
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-casd#tag=0.0.63&commit=121b55b4fd996a714900e6b94310394b3bccdb26")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../buildbox-casd \
    -G Ninja \
    -DCMAKE_CXX_FLAGS=-Wno-error=restrict \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Test 'cas_proxy_tests' and 'local_cas_service_tests' can take some time."
  ninja -k-1 test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
