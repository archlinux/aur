# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-snappy')
pkgver='0.5.1'
pkgrel=1
pkgdesc="Python bindings for the snappy compression library."
url="https://github.com/andrix/python-snappy"
depends=('python' 'snappy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://github.com/andrix/python-snappy/archive/$pkgver.tar.gz"
    "LICENSE")
sha256sums=('cf530b5a3e05e220003cdaf09150b56620c12a6e28557def9bbf01989e193931'
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
