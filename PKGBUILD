# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-hyperbolic
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python 3 library for constructing and drawing hyperbolic geometry"
arch=('any')
url="https://github.com/cduck/hyperbolic"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
#            'python-sphinx')
checkdepends=('python-nose'
              'python-numpy')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/cduck/hyperbolic/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('0b735e0d312d500f252337fcdb63fa9e')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests || warning "Tests failed" # -v -x
#   pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-hyperbolic() {
    depends=( 'python-numpy' 'python-drawsvg')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a examples "${pkgdir}/usr/share/doc/${pkgbase}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-hyperbolic-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
