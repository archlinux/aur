# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-zstandard')
_pkgname='zstandard'
pkgver='0.9.1'
pkgrel=1
pkgdesc="Python bindings to the Zstandard (zstd) compression library"
url="https://github.com/indygreg/python-zstandard"
depends=('python')
makedepends=(
    'python-setuptools')
checkdepends=('python-hypothesis')
optdepends=('python-cffi')
license=('BSD')
arch=('x86_64')
source=("https://github.com/indygreg/python-zstandard/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('59c7d6f1f85cebb5124abb50d8ec281c5311e0812e18785e28b197cf1515dd3b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build_ext
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
