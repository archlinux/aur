# Maintainer: Jesse R Codling <codling@umich.edu>

pkgbase='python-jupyterlab-vim'
pkgname=('python-jupyterlab-vim')
_module='jupyterlab_vim'
pkgver='4.1.0'
pkgrel=1
pkgdesc="Code cell vim bindings for JupyterLab and Jupyter-Server"
url="https://jupyterlab-contrib.github.io/jupyterlab-vim.html"
depends=('python' 'jupyter-lsp' 'jupyter-collaboration')
makedepends=('python-build' 'python-installer' 'python-hatch-nodejs-version' 'python-hatch-jupyter-builder')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('11d850ee91b2864a7b6298aae465219a822f8ccc6e01f23fa03f1ee617afe330')

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
