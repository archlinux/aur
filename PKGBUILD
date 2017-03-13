# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-snappy')
pkgver='0.5'
pkgrel=1
pkgdesc="Python bindings for the snappy compression library."
url="https://github.com/andrix/python-snappy"
depends=('python')
makedepends=('snappy')
license=('BSD')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/70/fa/621594e313b2b9074585af63668f7a31839c4e4d69df536ab592e6e1e353/python-snappy-0.5.tar.gz"
    "LICENSE")
sha256sums=('c7fe37679ebfc73840c7cc83657a76bc1ac978efa286b8ac3569fd0630d2b80d'
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
