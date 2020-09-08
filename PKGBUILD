# Maintainer Marcus Hoffmann <bubu@bubu1.eu>

_pkgname="fabric"
pkgname=python-${_pkgname}
pkgver=2.5.0
pkgrel=1
pkgdesc="Simple, Pythonic remote execution and deployment"
arch=('any')
url="https://www.fabfile.org/"
license=("BSD")
depends=("python" "python-paramiko" "python-invoke" "python-cryptography")
#makedepends=("python-setuptools" "python-pytest" "python-mock" "python-pytest-relaxed")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('24842d7d51556adcabd885ac3cf5e1df73fc622a1708bf3667bf5927576cdfa6')

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # pytest-relaxed which the tests rely on isn't working on modern pytest versions
    #PYTHONPATH=build/lib pytest
}


build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1 --skip-build
    install -D -p -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
