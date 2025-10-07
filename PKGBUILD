# Not affiliated with Intel.
# Contact me about packaging issues tho. <bjoel2@i2pmail.org>

pkgname="intel-metrics-discovery-git"
pkgver=metrics.discovery.1.14.182.r0.g1524a7a
pkgrel=1
pkgdesc="User mode library that provides access to GPU performance data"
arch=('x86_64')
url="https://github.com/intel/metrics-discovery"
license=('MIT')
options=(!strip staticlibs)
depends=('libdrm' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/intel/metrics-discovery.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  mkdir build && cd build
  cmake .. && make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
