# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-comicfn2dict
_pkgname="${pkgname#python-}"
pkgver=1.0.1
pkgrel=1
pkgdesc='Parse common comic filenames and return a dict of metadata attributes'
arch=(any)
url='https://github.com/ajslater/comicfn2dict'
license=('GPL-3.0-only')
depends=(python)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-uv-build
  python-wheel
)
checkdepends=(
  python-deepdiff
  python-pytest
  python-pytest-cov
  python-uv
  git
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8e8d640176679488ea4b1150381b432609e854b918abeb9de7b97c97962a6aae')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"

  # pytest tests
  uv run --group test pytest
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  #  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
