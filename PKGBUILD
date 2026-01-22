# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.17
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
b2sums=('0631309349edafbfb879b76ca646fdc1cba2b26264c08999c145cdda2f9ecb03f1eaa51014381fb4e80624e0939143955002cdc28220c66b34dadcced580aae6')

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
