# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-griffecli
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=2.0.2
pkgrel=1
pkgdesc="Signatures for entire Python programs - cli"
arch=('any')
url="https://github.com/mkdocstrings/griffe"
license=('ISC')
makedepends=('python-hatchling'
             'python-pdm-backend'
             'python-uv-dynamic-versioning>=0.7.0'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest-import-check'
#              'python-colorama'
#             )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d3080101c6778aa89be54bd917c54197')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest --import-check -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-griffecli() {
    depends=('python>=3.10' "python-griffelib=${pkgver}" 'python-colorama>=0.4')
#   optdepends=('python-griffelib-doc: Documentation for griffecli')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-griffecli-doc() {
#    pkgdesc="Documentation for Python griffecli"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
