# Maintainer: George C. Privon <accounts5 at privon dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-emcee
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=3.0.1
pkgrel=1
pkgdesc="Kick ass affine-invariant ensemble MCMC sampling"
arch=('i686' 'x86_64')
url="http://emcee.readthedocs.io/"
depends=('python-numpy')
optdepends=('python-tqdm: For progress bars'
            'python-h5py: For HDF5 backend'
            'python-emcee-doc: Documentations for emcee')
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-scipy' 'python-h5py')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5dcedeec26010549af341863966dd4c7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check(){
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package_python-emcee() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
