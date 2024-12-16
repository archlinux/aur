# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-extinction
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.4.7
pkgrel=1
pkgdesc="Fast interstellar dust extinction laws in Python"
arch=('i686' 'x86_64')
url="http://extinction.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'cython>=0.29.2'
             'python-build'
             'python-installer'
             'python-numpy>=2')  # wheel required by new setuptools
#            'python-sphinx'
#checkdepends=('python-pytest'
#             'python-pytest-xdist'
#             )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('71dd9fa8e0a9ffdadd2641ede2184a36')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-extinction() {
    depends=('python-numpy>=1.13.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
