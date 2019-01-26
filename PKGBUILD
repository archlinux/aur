# Maintainer: Oliver Papst <opapst at ikp dot tu-darmstadt dot de>
_pyname=probfit
pkgname=python-${_pyname}
pkgver=1.1.0
pkgrel=1
pkgdesc="Cost function builder for fitting distributions, intended to be used with iminuit."
arch=('i686' 'x86_64')
url="https://probfit.readthedocs.io/"
license=('MIT')
makedepends=('python-setuptools' 'python-numpy' 'cython')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('f185676cdaea52e41ec354b4113b0dfd14ca442aae9e0bd46ab449157f1af98d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    python setup.py test
#}

package() {
    depends=('python>=3.4'
             'python-numpy'
             'python-iminuit')
    optdepends=('cython'
                'python-matplotlib: Plotting')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
