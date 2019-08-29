# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ci_watson
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4
pkgrel=1
pkgdesc="CI helper for STScI Jenkins"
arch=('i686' 'x86_64')
url="https://ci_watson.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python-relic' 'python-pytest' 'python-sphinx_rtd_theme' 'python-numpydoc' 'python-sphinx-automodapi')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('64a92637b9ff11a5b126e2cc6e5d17e7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

package_python-ci_watson() {
    depends=('python>=3.5' 'python-pytest>=3')
    optdepends=('python-ci_watson-doc: Documentation for CI Watson')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-ci_watson-doc() {
    pkgdesc="Documentation for CI Watson"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
