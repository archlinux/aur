# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-dropboxdrivefs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.4.1
pkgrel=1
pkgdesc="Dropbox implementation for fsspec module"
arch=('any')
url="https://github.com/fsspec/dropboxdrivefs"
license=('BSD-3-Clause')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
#            'python-sphinx'
#checkdepends=('python-pytest'
#              'python-fsspec'
#              'python-dropbox'
#)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('41a00af36264e7306303495a3ac47534')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # invalid_access_token
#    PYTHONPATH="build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-dropboxdrivefs() {
    depends=('python>=3.5' 'python-fsspec' 'python-requests' 'python-dropbox')
#   optdepends=('python-dropboxdrivefs-doc: Documentation for dropboxdrivefs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-dropboxdrivefs-doc() {
#    pkgdesc="Documentation for Python Parfive"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
