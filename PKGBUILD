# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=33.181.g18fced2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('any')
url='https://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=(
  'vapoursynth-plugin-vsjetpack'
)
optdepends=(
  'vapoursynth-plugin-fluxsmooth'
  'vapoursynth-plugin-misc-git'
  'vapoursynth-plugin-neo_f3kdb-git'
  'vapoursynth-plugin-nnedi3cl-git'
  'vapoursynth-plugin-removegrain-git'
  'vapoursynth-plugin-znedi3-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
  'python-hatchling'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=('git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  cd "${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
