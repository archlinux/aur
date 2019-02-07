# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-zstandard')
_pkgname='zstandard'
pkgver='0.10.2'
pkgrel=2
pkgdesc="Python bindings to the Zstandard (zstd) compression library"
url="https://github.com/indygreg/python-zstandard"
depends=('python')
makedepends=(
    'python-setuptools')
checkdepends=('python-hypothesis')
optdepends=('python-cffi')
license=('BSD')
arch=('x86_64')
source=("https://github.com/indygreg/python-zstandard/archive/$pkgver.tar.gz"
    "hypothesis-4.patch")
sha256sums=('f684c1457f99c344f9bb5268cca49cd96fcf239b7d27acf3785390427a6d1476'
            'e639bc7774c2ccfb145240858bd8f99af5bbadec38fe7071aea5159f18d13504')

prepare() {
    cd "${srcdir}"
    patch -p0 < hypothesis-4.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    python setup.py test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
