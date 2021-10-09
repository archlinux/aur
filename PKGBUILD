# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=neo_vague_denoiser
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=r2.2.g784b43c
pkgrel=1
pkgdesc="Plugin for Vapoursynth/Avisynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfAviSynthPlusEvolution/neo_Vague_Denoiser'
license=('GPL2')
makedepends=('git'
             'cmake'
             'avisynthplus'
             'vapoursynth'
             'tbb'
             )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/neo_Vague_Denoiser.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  mkdir -p build
}

build() {
  cd "${_plug}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package_avisynth-plugin-neo_vague_denoiser-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-vague-denoiser.so" "${pkgdir}/usr/lib/avisynth/libneo-vague-denoiser.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vapoursynth-plugin-neo_vague_denoiser-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-vague-denoiser.so" "${pkgdir}/usr/lib/vapoursynth/libneo-vague-denoiser.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
