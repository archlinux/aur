# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=jvsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.16.1.g0200b4f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/dnjulek/jvsfunc.git'
license=('MIT')
depends=(
  'vapoursynth-plugin-vsutil-git'
  'vapoursynth-plugin-lvsfunc-git'
  'vapoursynth-plugin-vsjetpack-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dnjulek/jvsfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
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
