# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-simplify-polyline
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.1.0
pkgrel=1
pkgdesc="Simplify an open of closed polyline"
arch=('any')
url="https://github.com/ShayHill/simplify_polyline"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('43a93e041fa4256bd0d50ec2c9015f4d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-simplify-polyline() {
    depends=('python>=3.9' 'python-numpy>=1.24.2')
    cd ${srcdir}/${_pyname}-${pkgver}

#   install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-simplify-polyline-doc() {
#    pkgdesc="Documentation for Python simplify_polyline"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
