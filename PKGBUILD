# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsmask
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.5.1.0.g3cd8ca7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vsmask.git'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vsjetpack-git'
  'vapoursynth-plugin-vsutil-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'vapoursynth-plugin-tcanny-git'
  'vapoursynth-plugin-tedgemask-git'
  'vapoursynth-plugin-awarpsharp2-git'
  'vapoursynth-plugin-awarpsharp2sf-git'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vsmask.git")
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
