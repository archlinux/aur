# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.7.3
pkgrel=1
pkgdesc="WCS based distortion models and coordinate transformation"
arch=('any')
url="https://stwcs.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-pytest'
              'python-stsci.tools'
#             'python-matplotlib'
              'python-lxml'
              'python-requests'
              )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('ccf8403dbeca13a8dbae238a88d9025f')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" -vv -l -ra --color=yes -o console_output_style=count
}

package_python-stwcs() {
    depends=('python>=3.8' 'python-astropy>=5.0.4' 'python-stsci.tools>=3.6' 'python-requests' 'python-lxml')
    optdepends=('python-stwcs-doc: Documentation for STWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
