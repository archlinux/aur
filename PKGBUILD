# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.3.2
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('i686' 'x86_64')
url="https://asdf.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python>=3.3'
             'python-setuptools'
             'python-numpy>=1.8'
             'python-jsonschema>=2.3.0'
             'python-yaml>=3.10'
             'python-six>=1.9.0'
             'python-astropy-helpers>=3.1'
             'python-semantic-version>=2.3.1')
#            'python-sphinx-astropy'
#            'graphviz')
checkdepends=('python-astropy' 'python-pytest-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1bd1ec303dfd812b84aaee7f20a1d71b')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package_python-asdf() {
    depends=('python>=3.3' 'python-numpy>=1.8' 'python-jsonschema>=2.3.0' 'python-yaml>=3.10' 'python-six>=1.9.0' 'python-semantic-version>=2.3.1')
    optdepends=('python-astropy>=3.0: Support for units, time, transform, wcs, or running the tests'
                'python-lz4: Support for lz4 compression'
                'python-pytest: For testing')
#               'python-pytest-astropy: For testing')
#               'python-asdf-doc: Documentation for Python-ASDF')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
}

#package_python-asdf-doc() {
#    pkgdesc="Documentation for Python ASDF module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
