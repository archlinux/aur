# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-snappy')
pkgver='0.5.4'
pkgrel=1
pkgdesc="Python bindings for the snappy compression library."
url="https://github.com/andrix/python-snappy"
depends=('python' 'snappy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://github.com/andrix/python-snappy/archive/$pkgver.tar.gz"
    "LICENSE")
sha256sums=('92fddfe0ea42c0011227850ee545081975ffe9de5da339d437a178e8015206e9'
            'd007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    python test_snappy.py
}

package() {
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
