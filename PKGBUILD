# Maintainer: taotieren <admin@taotieren.com>

pkgname=mujoco
pkgver=3.8.1
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=($CARCH)
url="https://www.mujoco.org"
license=('Apache-2.0')
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
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
sha256sums=('7ab4ef28af1fc2d2c4afd6612438c26851140ff6d97720ac7fa90e0807ff8574')

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
