# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
_base=matplotlib-cpp
pkgname="${_base}"-git
pkgver=r177.ef0383f
pkgrel=2
pkgdesc="Extremely simple yet powerful header-only C++ plotting library built on the popular matplotlib"
arch=('i686' 'x86_64')
url="https://github.com/lava/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(cmake git)
provides=(${_base})
conflicts=(${_base})
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_base}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake \
    -S "${_base}" \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 "${_base}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
