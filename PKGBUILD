# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.13
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
b2sums=('ab39744adf93a2f4caa5cecfda1ccc197a14823bc24c0d155d0087318161fd710413c3aaea26ad1f2e3a471342fcbb05ee5591e107c7a3680ec5e3213a66c92b')


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
