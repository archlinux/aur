# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-repoze.sphinx.autointerface
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.0.0
pkgrel=1
pkgdesc="Auto-generate Sphinx API docs from Zope interfaces"
arch=('any')
url="https://github.com/repoze/repoze.sphinx.autointerface"
license=('BSD')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-sphinx'
              'python-zope-interface')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('63471c93810215ac7ad02b966ad16c39')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package_python-repoze.sphinx.autointerface() {
    depends=('python-setuptools' 'python-sphinx>=4.0' 'python-zope-interface')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
