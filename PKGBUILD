# Maintainer: Jesse R Codling <codling@umich.edu>

pkgbase='python-jupyterlab-variableinspector'
pkgname=('python-jupyterlab-variableinspector')
_module='lckr_jupyterlab_variableinspector'
pkgver='3.2.1'
pkgrel=1
pkgdesc="Jupyterlab extension that shows currently used variables and their values."
url="https://github.com/jupyterlab-contrib/jupyterlab-variableInspector"
depends=('python' 'jupyterlab-lsp')
makedepends=(
        # build system components
        'python-build'
        'python-installer'
        'python-hatch-nodejs-version'
        'python-hatch-jupyter-builder'

        # required optdepends
        'python-isoduration'
        'python-fqdn'
        'python-jsonpointer'
        'python-uri-template'
        'python-rfc3339-validator'
        'python-webcolors'
        'python-debugpy'
        'python-jupyter-server-terminals'
        'python-rfc3986-validator'
        'python-types-python-dateutil'
)
license=('MIT')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('f3cda3f5abce5a632aa78b55225623ed2c7dc9924dc2dd93b92cda811f0138e5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
