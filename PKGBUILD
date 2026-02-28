# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Cilyan Olowen <gaknar at gmail dot com>

pkgname=python-sphinxcontrib-globalsubs
_pname=${pkgname#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Sphinx needs extension to add support for global substitutions to conf.py"
arch=("any")
url="https://github.com/missinglinkelectronics/sphinxcontrib-globalsubs"
license=('BSD-2-Clause')
makedepends=('python-setuptools')
#            'python-build'
#            'python-installer'
#)
checkdepends=('python-nose')
#checkdepends=('python-pytest-import-check'
#              'python-sphinx'
#    )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('439c899035d54a14c097ea0b908d76c87c8f6d8914dccffd2f5fa5ad5edd3288')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   mkdir -p dist/lib
#   bsdtar -xpf dist/${_pyname/-/_}-${pkgver}-py3-none-any.whl -C dist/lib
#   pytest dist/lib --import-check -vv -l -ra --color=yes -o console_output_style=count
    nosetests -v -x || warning "Tests failed"
}

package() {
    depends=('python-sphinx>=7.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
