# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python38-zstandard')
_pkgname='zstandard'
pkgver=0.19.0
pkgrel=1
pkgdesc="Python bindings to the Zstandard (zstd) compression library"
url="https://github.com/indygreg/python-zstandard"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-hypothesis')
optdepends=('python38-cffi')
license=('BSD')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/indygreg/python-zstandard/archive/$pkgver.tar.gz")
sha256sums=('8106c216bcaed7b70e6515b407adbfd21dd84c9855c9771530e0a3561b130454')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3.8 setup.py build_ext
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3.8 setup.py build_ext --inplace
    python3.8 setup.py test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
