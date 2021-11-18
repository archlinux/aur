# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.7.1
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'gsl')
#checkdepends=('python-pytest'
#              'python-matplotlib'
#              'python-future'
#              'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e6d96f823fd19180c88fc782e9b68cd9')

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   pytest "build/lib.linux-${CARCH}-${_pyver}"
#    python setup.py test
#}

package_python-galpy() {
    depends=('python-scipy' 'python-matplotlib' 'python-future' 'python-six' 'python-pytest' 'python-setuptools')
    optdepends=('python-galpy-doc: Documentation for galpy'
                'gsl>=1.14: For some advanced features'
                'python-astropy: For Quantity support'
                'python-astroquery: For the Orbit.from_name initialization method'
                'python-numexpr: For or plotting arbitrary expressions of Orbit quantities'
                'python-jax: For use of constant-anisotropy DFs in galpy.df.constantbetadf'
                'python-pynbody-git: Foruse of SnapshotRZPotential and InterpSnapshotRZPotential')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-galpy-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
