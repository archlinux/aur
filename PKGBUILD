# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-extinction
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.4.8
pkgrel=1
pkgdesc="Fast interstellar dust extinction laws in Python"
arch=('i686' 'x86_64')
url="http://extinction.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools'
             'cython>=0.29.2'
             'python-build'
             'python-installer'
             'python-numpy>=2')  # wheel required by new setuptools
#            'python-sphinx'
#checkdepends=('python-pytest'
#             'python-pytest-xdist'
#             )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "${pkgver}-test.py::https://github.com/sncosmo/extinction/raw/refs/tags/v${pkgver}/test.py"
#        "${pkgver}-fm_unred_2.3.dat::https://github.com/sncosmo/extinction/raw/refs/tags/v${pkgver}/testdata/fm_unred_2.3.dat"
#        "${pkgver}-fm_unred_3.1.dat::https://github.com/sncosmo/extinction/raw/refs/tags/v${pkgver}/testdata/fm_unred_3.1.dat"
#        "${pkgver}-fm_unred_4.0.dat::https://github.com/sncosmo/extinction/raw/refs/tags/v${pkgver}/testdata/fm_unred_4.0.dat"
#        "${pkgver}-fm_unred_5.3.dat::https://github.com/sncosmo/extinction/raw/refs/tags/v${pkgver}/testdata/fm_unred_5.3.dat"
#    )
md5sums=('214d70f79e469f26fa4e9a7f82283949')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    cp ${srcdir}/${pkgver}-test.py test_extinction.py
#    for dat in ${srcdir}/${pkgver}-*.dat; do mkdir -p testdata; cp ${dat} testdata/${dat##*-}; done
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-extinction() {
    depends=('python-numpy>=1.13.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
