# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Cilyan Olowen <gaknar at gmail dot com>

pkgname=python-sphinxcontrib-globalsubs
_pname=${pkgname#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
#"python-${_pname}-doc")
pkgver=0.1.2
pkgrel=1
pkgdesc="Sphinx needs extension to add support for global substitutions to conf.py"
arch=("any")
url="https://github.com/missinglinkelectronics/sphinxcontrib-globalsubs"
license=('BSD-2-Clause')
makedepends=('python-setuptools')
#            'python-build'
#            'python-installer')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('627823712c3db94d26d2b518e9fd7cd3d901f6ba54b3ab5bddabc7642b2a43b8')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests -v -x #|| warning "Tests failed"
}

package() {
    depends=('python-sphinx>=1.6')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
