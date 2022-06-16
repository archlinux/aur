# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sunpy-sphinx-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.2.32
pkgrel=1
pkgdesc="The sphinx theme for the SunPy website and documentation"
arch=('any')
url="https://github.com/sunpy/sunpy-sphinx-theme"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
#checkdepends=('python-pytest' 'python-sphinx')
checkdepends=('python-nose' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('70964489bf74272cd1647a5f0c788b6c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest
    nosetests
}

package_python-sunpy-sphinx-theme() {
    depends=('python-sphinx' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
