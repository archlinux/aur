# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=manim-beamer
pkgname=python-${_base,,}-git
pkgver=r75.9f716cc%
pkgrel=1
pkgdesc="Emulate LATEX beamer with Python and manim-slides"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(MIT)
depends=(python-annotated-types python-bibtexparser python-manim-slides python-manimpango pyside6 python-qtpy)
makedepends=(python-build python-installer python-hatchling git)
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
