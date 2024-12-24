# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=parserator
pkgname=python-${_base}
pkgver=0.6.9
pkgrel=2
pkgdesc="A toolkit for making domain-specific probabilistic parsers"
arch=('any')
url="https://github.com/datamade/${_base}"
license=(MIT)
depends=('python' 'python-lxml' 'python-crfsuite' 'python-chardet')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('4d40f6198b0f39101ea683fa5fa36ed221cc5a4e66360b0b9b0eec4762884c98a3eccbe5bb8c86e50966852f33d7c6e70e44630f2e9dbae08aaa4eeab3194339')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
