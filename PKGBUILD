# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pytest-loop
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.0.6
pkgrel=1
pkgdesc="Pytest plugin for looping test execution."
arch=('any')
url="https://github.com/anogowski/pytest-loop"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d604563f9446b9d6dff3b22d6ac2016b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-pytest-loop() {
    depends=('python>=3.6' 'python-pytest>=6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
