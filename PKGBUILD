# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsadjust
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r52.e4e2c5a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-adjust.git'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vsjetpack-git'
  'vapoursynth-plugin-vstransitions-git'
  'python-numpy'
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
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-adjust.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - . | tr -d v)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
