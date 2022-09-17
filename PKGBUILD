# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pygments-style-github
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.4
pkgrel=1
pkgdesc="A port of the github color scheme for pygments"
arch=('any')
url="https://github.com/hugomaiavieira/pygments-style-github"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pygments')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('dea9072f0ab9ede0f23651c380cc47a7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest #|| warning "Tests failed"
    nosetests || warning "Tests failed"
}

package_python-pygments-style-github() {
    depends=('python-pygments>=1.4')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
