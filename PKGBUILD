# Maintainer: taotieren <admin@taotieren.com>

pkgname=mujoco
pkgver=3.5.0
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=($CARCH)
url="https://www.mujoco.org"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
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
sha256sums=('3e364ab63160919d028d251df7e70581b5c7343cc4fafe98043b33f090313f13')

build() {
  cd "${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-Wno-error=discarded-qualifiers" \
    -DCMAKE_CXX_FLAGS="-Wno-error=discarded-qualifiers" \
    -B build \
    -G Ninja \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
