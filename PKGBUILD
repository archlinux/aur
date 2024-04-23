# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vardautomation
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.2.4.3.gfae0549
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Ichunjo/vardautomation'
license=('MIT')
depends=(
  'vapoursynth'
  'python-langcodes'
#   language-data
  'python-loguru'
  'python-lxml'
  'python-numpy'
  'python-psutil'
  'python-pymediainfo'
  'python-pyparsebluray-git'
  'python-pyparsedvd-git'
  'python-pytimeconv-git'
  'python-requests'
  'python-requests-toolbelt'
  'python-rich'
  'python-typing_extensions'
  'vapoursynth-plugin-vardefunc-git'
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
source=("${_plug}::git+https://github.com/Ichunjo/vardautomation.git")
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
