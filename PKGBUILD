# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.18
pkgrel=1
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD-3-Clause')
depends=(
  "python>=3.9"
  "python-click"
  "python-importlib-metadata"
)
makedepends=(
  "git"
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
)
optdepends=(
  "python-pygments: For syntax highlighting"
  "python-pytest: For running the unit-tests"
)
source=("${_name}::git+${url}#tag=v${pkgver}")
b2sums=('294ce9dd462a5bf95ea898888da3d8af58b200362dff34b93b7d94fae72122fdfb6c28adc8071bfafd943f5a32d44f01b1fc47606d0ca0ef10e119916a6b9c5b')

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
