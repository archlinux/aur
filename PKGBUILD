# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=pdf2docx
pkgname=python-${_base}
pkgver=0.5.9
pkgrel=2
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/artifexsoftware/${_base}"
license=('AGPL-3.0-only')
depends=('python')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('9789b4c6b3c8b002188c50682f43a7c306c7e1e2b29307c051076e07cb3cf445e3e2373bd52d1d60a1deed93ff8b90306c03e4178c1934a0cbcbb7a6a33587ad')

prepare() {
  cd "${_base}-${pkgver}"
}

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
