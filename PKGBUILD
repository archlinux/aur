# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-jupyterlab-spellchecker'
_name=jupyterlab_spellchecker
pkgver='0.8.4'
pkgrel=1
pkgdesc="A spell checker for JupyterLab."
url="https://pypi.org/project/${_name}/"
depends=('jupyter-lsp' 'jupyter-server' 'jupyterlab' 'python-hatch-jupyter-builder' 'python-hatch-nodejs-version' 'python-jupyterlab-server')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e0722f00c795e8b5d60655ed475dd91a67fe7180c32ac891a50f38c7abc7684b')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
