# Maintainer: taotieren <admin@taotieren.com>

pkgname=mujoco
pkgver=3.3.6
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
)
source=("${pkgname}::git+https://github.com/deepmind/mujoco.git#tag=$pkgver")
sha256sums=('f795bdbf5617d15bd1c1dcdef0125af0f6b4b532e8392a6363755160497ac618')

build() {
  cd "${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
