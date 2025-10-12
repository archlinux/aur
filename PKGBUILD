# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-uncompresspy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.1
pkgrel=1
pkgdesc="Pure Python package for uncompressing LZW files (.Z)"
arch=('any')
url="https://github.com/kYwzor/uncompresspy"
license=('BSD-3-Clause')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b281b85fd089d10f56d346c5da3cf95a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python -m unittest
#    pytest -vv -l -ra --color=yes -o console_output_style=count #-p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-uncompresspy() {
    depends=('python>=3.10')
#   optdepends=('python-uncompresspy-doc: Documentation for uncompresspy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-uncompresspy-doc() {
#    pkgdesc="Documentation for Python uncompresspy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
