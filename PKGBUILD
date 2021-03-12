# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.1
pkgrel=1
pkgdesc="Sphinx plugin for generating documentation from ASDF schemas"
arch=('any')
url="https://github.com/spacetelescope/sphinx-asdf"
license=('BSD')
makedepends=('python-setuptools-scm')
#checkdepends=('python-pytest' 'python-sphinx' 'python-yaml' 'python-mistune')
checkdepends=('python-pytest' 'python-sphinx' 'python-yaml' 'python-mistune' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('82a21a6a3828890cfeaf3e1719b02e188c325467614f5be33b4e73789e8bb42c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed"
#   python setup.py test
}

package() {
    depends=('python-yaml' 'python-mistune' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
