# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrgtools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.5.1.0.g81da5f7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-rgtools'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vstools-git'
  'vapoursynth-plugin-vspyplugin-git'
  'vapoursynth-plugin-vsexprtools-git'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'vapoursynth-plugin-removegrain-git'
  'vapoursynth-plugin-rgsf-git'
  'vapoursynth-plugin-vsakarin-git'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vs-rgtools.git")
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
