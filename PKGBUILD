# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-changelog
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.6.2
pkgrel=1
pkgdesc="Provides simple Sphinx markup to render changelog displays."
arch=('any')
url="https://sphinx-changelog.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-nose'
              'python-sphinx'
              'python-looseversion')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d638ad1df8a42b8984d0b173b36e69ef')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv --color=yes #|| warning "Tests failed"
    nosetests -v -x || warning "Tests failed"
}

package_python-changelog() {
    depends=('python-sphinx>=4.0.0' 'python-looseversion')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-changelog-doc() {
#    pkgdesc="Documentation for sphinx-changelog"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
