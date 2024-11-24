# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fsrcnn-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r5.0a72195
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Sg4Dylan/vapoursynth-fsrcnn-ncnn-vulkan'
license=('MIT')
depends=(
  'vapoursynth'
  'opencv-cuda'
  'vulkan-icd-loader'
  'glslang'
  'ncnn'
)
makedepends=(
  'git'
  'cmake'
  'vulkan-headers'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/Sg4Dylan/vapoursynth-${_plug}.git"
#  'https://github.com/Nlzy/vapoursynth-waifu2x-ncnn-vulkan/releases/download/r0.1/models.7z'
)
sha256sums=(
  'SKIP'
#   'SKIP'
)
options=('debug')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build

}

package(){
  DESTDIR="${pkgdir}" cmake --install build


  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
