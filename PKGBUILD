# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-mfusepy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Ctypes bindings for the high-level API in libfuse 2 and 3"
arch=('any')
url="https://github.com/mxmlnkn/mfusepy"
license=('ISC')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1ae1f62a73c41c902784f837e22c3a7d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    nosetests
}

package_python-mfusepy() {
    depends=('python>=3.9')
    optdepends=('fuse2' 'fuse3')
#   optdepends=('python-mfuse-doc: Documentation for mfusepy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-mfusepy-doc() {
#    pkgdesc="Documentation for Python mfusepy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
