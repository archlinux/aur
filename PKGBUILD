# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_tool=getnative
pkgname=vapoursynth-tools-${_tool}-git
pkgver=3.2.1.2.g720c395
pkgrel=1
pkgdesc="Tool for Vapoursynth: ${_tool} (GIT version)"
arch=('any')
url='https://github.com/Infiziert90/getnative'
license=('MIT')
depends=(
  'python-matplotlib'
  'vapoursynth-plugin-descale'
  'vapoursynth-plugin-ffms2'
  'vapoursynth-plugin-lsmashsource'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
provides=("vapoursynth-tools-${_tool}")
conflicts=("vapoursynth-tools-${_tool}" )
source=("${_tool}::git+https://github.com/Infiziert90/${_tool}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_tool}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_tool}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_tool}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_tool}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
