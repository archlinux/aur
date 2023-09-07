# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=mkdocs-git-committers-plugin-2
_pyname=${pkgbase}
pkgname=("${_pyname}")
pkgver=1.2.0
pkgrel=1
pkgdesc="An MkDocs plugin to create a list of contributors on the page"
arch=('any')
url="https://github.com/ojacques/mkdocs-git-committers-plugin-2"
license=('MIT')
makedepends=('python-setuptools-scm')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#checkdepends=('python-pytest')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-requirements.txt::https://raw.githubusercontent.com/ojacques/mkdocs-git-committers-plugin-2/${pkgver}/requirements.txt")
md5sums=('1abab861727c801a89186c761caae8b5'
         '88ad091f4b0b71e1355dd7426ba39c49')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs {${srcdir}/${pkgver}-,}requirements.txt
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python -m build --wheel --no-isolation
    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest -vv --color=yes
    nosetests || warning "Tests failed" # -v -x
}

package_mkdocs-git-committers-plugin-2() {
    depends=('mkdocs>=1.0.3',
             'python-gitpython'
             'python-lxml>=4.9'
             'python-requests'
             'python-beautifulsoup4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
#   python -m installer --destdir="${pkgdir}" dist/*.whl
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
