# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.10
pkgrel=1
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD-3-Clause')
depends=(
  "python>=3.8"
  "python-click"
  "python-tomli"
)
makedepends=(
  "git"
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
)
source=("${_name}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('9a644f05523cb07cc5b3153998ad866b65a0192449389fe5d71831dd12ae7ded')

_archive="${_name}-${pkgver}"
build() {
  cd "${_archive}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_archive}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
