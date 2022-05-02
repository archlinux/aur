# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Maintainer: benpiano800 <ben@poest.com>
pkgname=libcpufeatures
pkgver=0.7.0
pkgrel=2
pkgdesc="A cross-platform C library to retrieve CPU features (such as available instructions) at runtime."
url="https://github.com/google/cpu_features"
arch=(
  'i686'
  'x86_64'
)
license=(Apache)
depends=(
  'glibc'
)
makedepends=(
  'cmake'
  'git'
  'gtest'
)
provides=(
  "$pkgname=$pkgver"
)
conflicts=(
  "$pkgname"
  'libvolk'
)
source=(
  "git+https://github.com/google/cpu_features.git#tag=v${pkgver}"
)

sha256sums=(
  'SKIP'
)

build() {
  cmake -B build -S "${srcdir}/cpu_features" \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/cpu_features/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
