# Maintainer: Jesse R Codling <codling@umich.edu>

pkgbase='python-jupyterlab-vim'
pkgname=('python-jupyterlab-vim')
_module='jupyterlab_vim'
pkgver='4.1.3'
pkgrel=3
pkgdesc="Code cell vim bindings for JupyterLab and Jupyter-Server"
url="https://github.com/jupyterlab-contrib/jupyterlab-vim"
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

        # other build-only deps
        'python-types-python-dateutil'
        'python-rfc3986-validator'
)
license=('MIT')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('57e1a0a4eddd2334e8d7a7c0df80f5097b78f5480ffa84307f2e508df98b6878')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-jupyterlab-vim/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
