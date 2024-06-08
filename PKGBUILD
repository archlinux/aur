# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=jupyterlab-catppuccin
pkgver=0.2.2 # renovate: datasource=github-tags depName=catppuccin/jupyterlab
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
	python-debugpy
	python-fqdn
	python-installer
	python-isoduration
	python-jsonpointer
	python-rfc3339-validator
	python-rfc3986-validator
	python-terminado
	python-types-python-dateutil
	python-uri-template
	python-webcolors
	python-hatch-jupyter-builder
	python-hatch-nodejs-version
)
arch=("any")
license=("MIT")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/catppuccin/jupyterlab/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('a81ecc1b855f38c18dc75ca261933a0a8d54fbb24522815c2dc1f18f8e639653')

build() {
	cd "jupyterlab-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "jupyterlab-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
