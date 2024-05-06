# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-pyprojroot
_pkgname="${pkgname#python-}"
pkgver=0.3.0
pkgrel=3
pkgdesc='Find project root paths and return relative project files'
arch=('any')
url=https://github.com/chendaniely/pyprojroot
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('679c6a4e228ec418fdd0196ba5620df6e55bdaf446e5037eb0ab3b097610543298f9f1802ebbaa9d244c6f463b5548778b00923374970fd15ac001a98c6c8a54')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
