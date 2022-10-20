# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=depan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.g2f05589
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173505'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Vapoursynth-Plugins-Gitify/DePan.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  chmod +x "${_plug}/configure"
}

build() {
  cd "${_plug}"
  ./configure \
    --install="${pkgdir}/usr/lib/vapoursynth" \
    --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
    --extra-ldflags="${LDFLAGS}"

  make
}

package() {
  cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
