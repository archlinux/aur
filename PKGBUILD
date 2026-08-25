# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>
# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=subtext
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R7.0.g662577d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/vapoursynth/subtext'
license=('MIT')
depends=(
  'vapoursynth'
  'libass'
  'ffmpeg'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'meson-python'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/subtext.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
