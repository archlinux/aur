# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.16
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
b2sums=('d4b07988c6a0692800ab5f7025aa0945982c5311c622711708c43446dbcd10c6e31bc5c66a86745ed5938ac778e287fea8e49a6b1575c213fd81863830d59e75')

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
