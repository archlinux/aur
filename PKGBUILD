# Maintainer: George C. Privon <accounts5 at privon dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-emcee
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.1.2
pkgrel=1
pkgdesc="Kick ass affine-invariant ensemble MCMC sampling"
arch=('any')
url="http://emcee.readthedocs.io"
depends=('python-numpy')
optdepends=('python-tqdm: For progress bars'
            'python-h5py: For HDF5 backend'
            'python-scipy'
            'python-emcee-doc: Documentations for emcee')
license=('MIT')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a36514826f37ba2ca8b42435373a16fa')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-emcee() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
