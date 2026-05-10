# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=mopidy-tidal-goodies-git
_pkgname=mopidy-tidal-goodies
_pyname=mopidy_tidal_goodies
pkgver=r2.1d5bb7c
pkgrel=1
pkgdesc="HTTP companion for mopidy-tidal: favorites, listening history, mixes"
arch=('any')
url="https://github.com/prietus/mopidy-tidal-goodies"
license=('Apache-2.0')
depends=(
  'mopidy'
  'python-tornado'
  'python-pykka'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'mopidy-tidal: required for /favorites endpoints (stats works without it)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
