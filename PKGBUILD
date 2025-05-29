# Maintainer: envolution
# Contributor: devome <evinedeng@hotmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=eval-type-backport
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.2
pkgrel=1
pkgdesc="Like typing._eval_type, but lets older Python versions use newer typing features."
arch=("any")
url="https://github.com/alexmojaki/${_pipname}"
license=('MIT')
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('f0576b4cf01ebb5bd358d02314d31846af5e07678387486e2c798af0e7d849c1')

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
