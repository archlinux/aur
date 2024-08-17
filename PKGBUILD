# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=jupyterlab-catppuccin
pkgver=0.2.4 # renovate: datasource=github-tags depName=catppuccin/jupyterlab
pkgrel=1
pkgdesc="Soothing pastel theme for JupyterLab"
url="https://github.com/catppuccin/jupyterlab"
depends=(python jupyterlab)
makedepends=(
	jupyter-lsp
	jupyterlab
	nodejs
	npm
	python-build
	python-installer
)
arch=("any")
license=("MIT")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/catppuccin/jupyterlab/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('6538bc09e6ba12782c0e3f9f2aba32aa8a8b4c4f607a014ae1dff841a5b5d3bb')

build() {
	cd "jupyterlab-$pkgver"
	python -m build --wheel
}

package() {
	cd "jupyterlab-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
