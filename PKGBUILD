# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsdeband
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.1.2.g01f9f0d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-deband'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vstools-git'
  'vapoursynth-plugin-vskernels-git'
  'vapoursynth-plugin-vsexprtools-git'
  'vapoursynth-plugin-vsrgtools-git'
  'vapoursynth-plugin-vsmask-git'
  'vapoursynth-plugin-vsaa-git'
  'vapoursynth-plugin-vsscale-git'
  'vapoursynth-plugin-vsdenoise-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
optdepends=('vapoursynth-plugin-neo_f3kdb-git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=(
  "vapoursynth-plugin-${_plug}"
  'vapoursynth-plugin-debandshit-git'
)
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-deband.git")
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

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
