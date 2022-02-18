# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf-standard
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.0.0
pkgrel=1
pkgdesc="A HTTP and FTP parallel file downloader"
arch=('any')
url="https://asdf-standard.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-sphinx' 'python-sphinx-bootstrap-theme' 'python-sphinx-asdf' 'graphviz')
#checkdepends=('python-pytest' 'python-jsonschema')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b83b605a4447557c719a7b22a4282692')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest
#}

package_python-asdf-standard() {
    depends=('python>=3.7' 'python-importlib_resources>=3')
    optdepends=('python-asdf-standard-doc: Documentation for ASDF Standard')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-asdf-standard-doc() {
    pkgdesc="Documentation for ASDF Standard"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
