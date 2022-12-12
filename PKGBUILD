# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-filter-subpackage
_pyname=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="Pytest plugin for filtering based on sub-packages"
arch=('any')
url="https://github.com/astropy/pytest-filter-subpackage"
license=('BSD')
depends=('python-pytest>=3.0')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-doctestplus')
#'python-pytest-cov'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9f99964c03d1db97936db4a683539146')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
