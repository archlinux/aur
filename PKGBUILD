# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=jupyterlab-catppuccin
pkgver=0.2.3 # renovate: datasource=github-tags depName=catppuccin/jupyterlab
pkgrel=1
pkgdesc="Soothing pastel theme for JupyterLab"
url="https://github.com/catppuccin/jupyterlab"
depends=(python jupyterlab)
makedepends=(
	jupyter-lsp
	jupyterlab
	nodejs
	npm
	python-setuptools
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

sha256sums=('9e905dd49ac1a66aa75e08cd836685b46f9d6fe80a907172c35accf79d65a948')

build() {
	cd "jupyterlab-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "jupyterlab-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
