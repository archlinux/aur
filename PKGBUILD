# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=pdf2docx
pkgname=python-${_base}
pkgver=0.5.9
pkgrel=1
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/artifexsoftware/${_base}"
license=('AGPL-3.0-only')
depends=('python')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz
  "drop-pip-requirement.patch")
b2sums=('9789b4c6b3c8b002188c50682f43a7c306c7e1e2b29307c051076e07cb3cf445e3e2373bd52d1d60a1deed93ff8b90306c03e4178c1934a0cbcbb7a6a33587ad'
        '5b9c379fff585d1b4a242fe3da34b83d647be3575f032e936d085b9d0eded1027a471ecd8e1674dca6917d13cf255a182deede577e121cb7b3140590f077e971')

prepare() {
  cd "${_base}-${pkgver}"
  patch -i ../drop-pip-requirement.patch
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
