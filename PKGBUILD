# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-parfive
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="A HTTP and FTP parallel file downloader"
arch=('i686' 'x86_64')
url="https://parfive.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm' 'python-sphinx-astropy' 'python-aiohttp' 'python-tqdm' 'graphviz' 'python-sunpy-sphinx-theme')
#checkdepends=('python-pytest-localserver' 'python-pytest-asyncio' 'python-pytest-socket' 'python-aioftp')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2fe38ca23ee2c7bea7714b44c2cad10c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   pytest
}

package_python-parfive() {
    depends=('python>=3.6' 'python-tqdm' 'python-aiohttp')
    optdepends=('python-aioftp: For downloads over FTP'
                'python-parfive-doc: Documentation for Parfive')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-parfive-doc() {
    pkgdesc="Documentation for Python Parfive"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
