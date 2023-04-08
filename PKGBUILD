# Maintainer: George C. Privon <accounts5 at privon dot com>

_pyname=corner
pkgname=python-${_pyname}
pkgver=2.2.2
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://corner.readthedocs.io"
depends=('python-matplotlib>=2.1')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-nose')
optdepends=('python-scipy' 'python-arviz>=0.9')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3d255640bde136724e1a516fb246367a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
