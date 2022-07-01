# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci_rtd_theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.0.0
pkgrel=1
pkgdesc="STScI Branded Sphinx theme"
arch=('any')
url="https://github.com/spacetelescope/stsci_rtd_theme"
license=('BSD')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer')
#checkdepends=('python-sphinx')
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bec3b79fd0cf3da83a3c2e3e43540f72')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   python setup.py test
    nosetests
}

package_python-stsci_rtd_theme() {
    depends=('python-sphinx>=1.3' 'python-sphinx_rtd_theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
