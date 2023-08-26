# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>
# Contributor: Ivan "Penter" <ivaiva1999ivaiva@gmail.com>

pkgname=cpr-git
pkgver=1.10.1.r20.ge65e685
pkgrel=1
pkgdesc="C++ Requests: Curl for People"
arch=(x86_64 i686)
url="https://github.com/libcpr/cpr"
license=(MIT)
depends=(glibc gcc-libs curl openssl)
makedepends=(git cmake )
provides=(cpr)
conflicts=(cpr)
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd cpr
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S cpr \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPR_BUILD_TESTS=OFF \
    -DCPR_USE_SYSTEM_CURL=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D cpr/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
