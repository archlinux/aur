# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.0rc8
pkgrel=1
pkgdesc="Sphinx plugin for generating documentation from ASDF schemas"
arch=('any')
url="https://github.com/spacetelescope/sphinx-asdf"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-sphinx' 'python-yaml' 'python-mistune' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('4f81b36a29ffc2d48602a8134180cd9469aa1beb55357557320d6c37ca6cd6f7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   PYTHONPATH="build/lib" pytest
    python setup.py test
}

package() {
    depends=('python-yaml' 'python-mistune' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
