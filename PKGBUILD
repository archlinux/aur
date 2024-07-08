# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.11
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
sha256sums=('4d613f13dec374646f0267c0c54eef24306d825b63e76dd06a7179ba338b72bb')

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
