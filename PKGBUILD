# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-comicfn2dict
_pkgname="${pkgname#python-}"
pkgver=0.3.2
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
sha256sums=('a761b0bab44d6bcc32d3fc697f46d7262b6f05c5539b491fbbb69008b40ce59d')

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
