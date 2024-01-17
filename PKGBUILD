# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=pdf2docx
pkgname=python-${_base}
pkgver=0.5.7
pkgrel=1
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/artifexsoftware/${_base}"
license=('GPL')
depends=('python')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pip')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('4ece3ca005b3edc44f2282ff85bf36673e191e0bc95b2f3d20a47593cfc1d6c24cc9f40f2354f61c6324a1836d8daa51ddadf68240c6a0fd77dbe8b2875a2111')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
