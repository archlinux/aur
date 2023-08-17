# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_py="python"
_pkgname=twspace-dl
pkgname="${_pkgname}-git"
pkgver=2023.7.24.1
_pkgver="${pkgver}.0"
pkgrel=1
pkgdesc="A python module to download twitter spaces."
arch=('any')
url="https://github.com/HoloArchivists/${_pkgname}"
license=('custom')
depends=(
  "${_py}"
  "${_py}-mutagen"
)
makedepends=(
  'git'
  "${_py}-poetry"
)
optdepends=()
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${_pkgname}"
  "${_py}" -m build \
	   --wheel \
	   --no-isolation
}

package() {
  cd "${_pkgname}"
  export PYTHONHASHSEED=0
  python -m installer \
	 --destdir="${pkgdir}" \
	 dist/*.whl
  install -Dm644 \
	  LICENSE \
	  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
