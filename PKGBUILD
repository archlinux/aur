# Maintainer: haxibami <contact at haxibami dot net>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-asn1
pkgver=2.7.1
pkgrel=1
pkgdesc='ASN.1 encoder/decoder'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
depends=('python-future')
makedepends=(
  'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('024c4d11f477f91cca5c2c2db130a3ad0a3f0320f7b0b9364a37b0e4b70d6716')

build() {
  cd "${pkgname}-${pkgver}"
  export PYTHONPATH="${PWD}/src"
  python -m build --wheel --no-isolation
  sphinx-build -b man docs/ docs/_build/man
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m pytest -x tests
}

package_python-asn1() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "docs/_build/man/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
