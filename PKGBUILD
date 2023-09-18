# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=pvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.4.0.2.g9786659
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=180426'
license=('GPL')
depends=(
  'vapoursynth-plugin-havsfunc-git'
  'vapoursynth-plugin-pyd2v-git'
  'python-pymediainfo'
  'python-more-itertools'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/rlaPHOENiX/pvsfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  sed 27d -i "${_plug}/pyproject.toml"
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
