# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=pdf2docx
pkgname=python-${_base}
pkgver=0.5.8
pkgrel=4
pkgdesc="A Python library for converting pdf to docx"
arch=('any')
url="https://github.com/artifexsoftware/${_base}"
license=('AGPL-3.0-only')
depends=('python')
depends=('python' 'python-pymupdf' 'python-docx' 'python-fonttools' 'python-numpy' 'python-opencv' 'python-fire')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz
  "drop-pip-requirement.patch")
b2sums=('5abf7201c0d2991aa21d18e491073c1142b2e49d86fbfd271f067e69d392526dfb7a4dac240530011e036b2160c2b53fd783648ca99cee2481637e42eb556693'
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
