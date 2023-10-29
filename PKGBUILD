# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.7
pkgrel=2
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD')
depends=(
  "python>=3.8"
  "python-click"
  "python-tomli"
)
makedepends=(
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
)
checkdepends=(
  "python-pytest"
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  "b1a0841527f94fdf10415ce4f3b273a36d62c229412aa5e81d4664473405f29c"
)
_archive="${_name}-${pkgver}"

build() {
  cd "${_archive}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_archive}"
  PYTHONPATH="." pytest
}

package() {
  cd "${_archive}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
