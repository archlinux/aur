# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=jupyterlab-catppuccin
pkgver=0.2.5 # renovate: datasource=github-tags depName=catppuccin/jupyterlab
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

sha256sums=('8f16ace5c8330b0d3f7cd0a469a28a67aeda64f5e52878271d171c49c987818a')

build() {
	cd "jupyterlab-$pkgver"
	python -m build --wheel
}

package() {
	cd "jupyterlab-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
