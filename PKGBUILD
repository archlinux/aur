# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=usaddress
pkgname=python-${_base}
pkgver=0.5.13
pkgrel=1
pkgdesc="A python library for parsing unstructured United States address strings into address components."
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python' 'python-crfsuite'  'python-probableparsing')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-parserator')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('ddea8ad92514857f19299299183e9f14ea8b32c0d863c9ee76d6c9a7b6b178d8a2c3a92133edfc1927526a76098304168be225c2ec9ef07a840f47a68807c4bd')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
