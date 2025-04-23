# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.14
pkgrel=1
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD-3-Clause')
depends=(
  "python>=3.9"
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
b2sums=('94979a5c796047dfe33eccabc557e2632178c8d6ef571bc3f3f04900688bd3e7a209e52ed2a4d7f86240d155cab9c29f49ed0879efe6cafbf54ab68866016584')

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
