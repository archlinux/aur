# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.12
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
b2sums=('40addc00836cb916569c4aace355ce59778a0a596f767e3e82e57dee90b1ab9ea49e1636282b825c8038231043406ccaae98fb12a04c9f77feeb57979a9e5be7')

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
