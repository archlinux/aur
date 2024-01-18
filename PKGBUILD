# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinxemoji
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.3.0
pkgrel=1
pkgdesc="An extension to use emoji codes in your Sphinx documentation"
arch=('any')
url="https://sphinxemojicodes.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools'
#            'python-wheel'
             'python-build'
             'python-installer')
#'python-sphinx')
checkdepends=('python-pytest'
              'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('70b289f004e6c24efe574130013841d2')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -ra --color=yes -o console_output_style=count
}

package_python-sphinxemoji() {
    depends=('python-sphinx>=4.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinxemoji-doc() {
#    pkgdesc="Documentation for Sphinx-Gallery extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
