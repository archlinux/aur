# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=metaphone
pkgname=python-${_base}
pkgver=0.6.0
pkgrel=4
pkgdesc="A Python implementation of the Metaphone and Double Metaphone algorithms"
arch=('any')
url="https://github.com/oubiwann/${_base}"
license=('custom:BSD-3-clause')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('faac5f1fdb741bcea6d92c39838203a5ac9b7875c13876edca2b75fffb5f0817fb69e4545e7fde22c697a94e6639c6067bdbe06a239aed477047098ddfddf1fe')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  nosetests -v . || warning "Tests failed"
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
