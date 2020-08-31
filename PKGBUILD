# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-einsteinpy_geodesics
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.0
pkgrel=1
pkgdesc="Python wrapper for a Julia solver for geodesics in the Kerr family of spacetimes"
arch=('i686' 'x86_64')
url="https://docs.geodesics.einsteinpy.org"
license=('MIT')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-doctestplus' 'python-numpy' 'julia' 'gcc-fortran')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('98aa1afff37c1a0d1f7fd35c094a96c9')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
#   cd ${srcdir}/${_pyname}-${pkgver}/docs
#   make html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    julia -e 'import Pkg; Pkg.add("DifferentialEquations"); Pkg.add("ODEInterfaceDiffEq")'
#    PYTHONPATH="./build/lib" pytest
#}

package() {
    depends=('python-numpy' 'julia>=1.5')
    optdepends=('python-einsteinpy_geodesics-doc: Documentation for EinsteinPy Geodesics'
                'python-pytest-doctestplus: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-einsteinpy_geodesics-doc() {
#    pkgdesc="Documentation for EinsteinPy Geodesics"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/{LICENSE.rst,LICENSE_MIT.txt}
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
