# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astrodendro
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.2.0
pkgrel=1
pkgdesc="Python package for computation of astronomical dendrograms"
arch=('i686' 'x86_64')
url="https://dendrograms.readthedocs.io/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-pytest' 'python2-pytest' 'python2-matplotlib' 'python-matplotlib' 'python2-mock' 'python-mock' 'python2-astropy' 'python-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6f4155b1d4a4b2d9cb9ae154f88c5710')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

#check() {
#    msg "Checking Python3"
#    cd ${srcdir}/${_pyname}-${pkgver}
#    python setup.py test
#
#    msg "Checking Python2"
#    cd ${srcdir}/${_pyname}-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-astrodendro() {
    depends=('python2>=2.6' 'python2-numpy>=1.4.1' 'python2-astropy>=0.2.0' 'python2-h5py>=0.2.0')
    optdepends=('python2-matplotlib: For plotting'
                'python2-pytest: For testing'
                'python2-mock: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astrodendro() {
    depends=('python' 'python-numpy>=1.4.1' 'python-astropy>=0.2.0' 'python-h5py>=0.2.0')
    optdepends=('python-matplotlib: For plotting'
                'python-pytest: For testing'
                'python-mock: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -D -m644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-astrodendro-doc() {
#    pkgdesc="Documentation for Python astrodendro module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
