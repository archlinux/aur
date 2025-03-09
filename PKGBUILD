# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsffdnet
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.1.1.ge770853
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/NSQY/vs-ffdnet'
license=('MIT')
depends=(
  'vapoursynth'
  'python-numpy'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
optdepends=(
  'python-pytorch: CPU with AVX2 optimizations'
  'python-pytorch-cuda: CUDA with CPU with AVX2 optimizations'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/NSQY/vs-ffdnet.git")
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
