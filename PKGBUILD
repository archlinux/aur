# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-iminuit
pkgname=('python-iminuit' 'python2-iminuit')
pkgver=1.2
pkgrel=1
pkgdesc="Python interface for MINUIT, a physics analysis tool for function minimization."
arch=(any)
url="http://iminuit.readthedocs.io/en/latest/"
license=('GPL' 'MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('cython' 'cython2' 'python-nose' 'python2-nose' 'python-matplotlib' 'python2-matplotlib' 'python-pytest-cov' 'python2-pytest-cov')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/i/iminuit/iminuit-${pkgver}.tar.gz")
md5sums=('4701ec472cae42015e26251703e6e984')

prepare() {
    cd ${srcdir}/iminuit-${pkgver}

    cp -a ${srcdir}/iminuit-${pkgver}{,-py2}
}

build () {
    msg "Building Python2"
    cd ${srcdir}/iminuit-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/iminuit-${pkgver}
    python setup.py build
}

#check(){
#    cd ${srcdir}/iminuit-${pkgver}
#    python setup.py test
#
#    cd ${srcdir}/iminuit-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-iminuit() {
    depends=('python2>=2.7')
    optdepends=('python2-numpy'
                'ipython2'
                'python2-matplotlib'
                'python2-pytest-cov: For testing and get a coverage report'
                'cython2'
                'python2-sphinx: For docs building'
                'python-iminuit-doc: Documentation for python-iminuit')
    cd ${srcdir}/iminuit-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-iminuit() {
    depends=('python>=3.4')
    optdepends=('python-numpy'
                'ipython'
                'python-matplotlib'
                'python-pytest-cov: For testing and get a coverage report'
                'cython'
                'python-sphinx: For docs building'
                'python-iminuit-doc: Documentation for python-iminuit')
    cd ${srcdir}/iminuit-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
