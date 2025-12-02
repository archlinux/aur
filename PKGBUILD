# Maintainer: envolution
# Contributor: devome <evinedeng@hotmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=eval-type-backport
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="Like typing._eval_type, but lets older Python versions use newer typing features."
arch=("any")
url="https://github.com/alexmojaki/${_pipname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('57e993f7b5b69d271e37482e62f74e76a0276c82490cf8e4f0dffeb6b332d5ed')

build() {
  cd "${_pipname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pipname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
