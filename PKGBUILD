# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=libp2p
pkgname=vapoursynth-lib-${_plug}-git
pkgver=2.1.g770cc31
pkgrel=1
pkgdesc="Library for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/DJATOM/LibP2P-Vapoursynth'
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-lib-${_plug}")
conflicts=("vapoursynth-lib-${_plug}")
source=("${_plug}::git+https://github.com/DJATOM/LibP2P-Vapoursynth.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --prefix /usr

  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
