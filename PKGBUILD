# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=neo_f3kdb
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=r7.0.ga72cf3d
pkgrel=1
pkgdesc="Plugin for Vapoursynth/Avisynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=176553'
license=('GPL')
makedepends=('git'
             'cmake'
             'avisynthplus'
             'vapoursynth'
             'tbb'
             )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/neo_f3kdb.git")
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

package_avisynth-plugin-neo_f3kdb-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-f3kdb.so" "${pkgdir}/usr/lib/avisynth/libneo-f3kdb.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}

package_vapoursynth-plugin-neo_f3kdb-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm755 "${_plug}/build/libneo-f3kdb.so" "${pkgdir}/usr/lib/vapoursynth/libneo-f3kdb.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

