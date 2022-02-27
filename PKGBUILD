# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-ginga
_pyname=${pkgname#python-}
pkgver=3.3.0
pkgrel=1
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('any')
url="https://ejeschke.github.io/ginga"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest-astropy-header' 'python-astropy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('29c9a317e59a72ab1a4141fa385d31c0')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package(){
    depends=('python-astropy>=3.2' 'python-qtpy>=1.1')
    optdepends=('python-scipy>=0.18.1'
                'python-pillow>=3.2.0'
                'python-matplotlib>=2.1'
                'python-opencv>=4.5.4.58'
                'python-piexif>=1.0.13'
                'python-beautifulsoup4>=4.3.2'
                'python-astroquery>=0.3.5'
                'python-docutils: to display help for plugins'
                'python-photutils'
                'python-fitsio: for opening FITS files'
                'python-astlib: for WCS resolution'
                'python-ginga-doc: Documentation for Python-ASDF'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
