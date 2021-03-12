# Maintainer: George C. Privon <accounts5 at privon dot com>

_pyname=corner
pkgname=python-${_pyname}
pkgver=2.2.1
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://corner.readthedocs.io"
depends=('python-matplotlib>=2.1' 'python-nose' 'python-pandas')
makedepends=('python-setuptools-scm')
optdepends=('python-scipy' 'python-arviz>=0.9' 'python-black' 'python-isort' 'python-toml')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4fc5208462aa3e4ba83f1e874382e287')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
