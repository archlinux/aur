# Maintainer: taotieren <admin@taotieren.com>

pkgname=mujoco
pkgver=3.13.0
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=($CARCH)
url="https://www.mujoco.org"
license=('Apache-2.0')
depends=(
  libgcc_s.so
  libstdc++.so
)
makedepends=(
  'cmake'
  'glfw'
  'git'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxrandr'
  'ninja'
  'mold'
)
source=("${pkgname}::git+https://github.com/deepmind/mujoco.git#tag=$pkgver")
sha256sums=('c3d66cde54a9889b088ce86bf5ca763ad650a5faf6161a9ee47076852b7c0cae')

build() {
  cd "${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-Wno-error=discarded-qualifiers" \
    -DCMAKE_CXX_FLAGS="-Wno-error=discarded-qualifiers" \
    -B build \
    -G Ninja \
    -Wno-author

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
