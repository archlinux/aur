# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=pdf2docx
pkgname=python-${_base}
pkgver=0.5.8
pkgrel=1
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/artifexsoftware/${_base}"
license=('GPL')
depends=('python')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pip')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('40b95aafb7f2117d2eb275c6a3d89c4c2f02693f9545c8524af3ae25f3602ec180dc4a60fd62755ad728556bf61df7a9eaaae55c29ae4953885d6e86b6d32dc4')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
