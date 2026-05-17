# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=mopidy-goodies-git
_pkgname=mopidy-goodies
_pyname=mopidy_goodies
pkgver=r9.a35a8d2
pkgrel=1
pkgdesc="HTTP companion endpoints for Mopidy: Tidal favorites, listening stats, audio chain info"
arch=('any')
url="https://github.com/prietus/mopidy-goodies"
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
  'mopidy-tidal: required for /favorites endpoints (stats and audio work without it)'
)
provides=("${_pkgname}" 'mopidy-tidal-goodies')
conflicts=("${_pkgname}" 'mopidy-tidal-goodies' 'mopidy-tidal-goodies-git')
replaces=('mopidy-tidal-goodies-git' 'mopidy-tidal-goodies')
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
