# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-dbx
_name=dbx
pkgver=0.7.6
pkgrel=1
pkgdesc="DataBricks CLI eXtensions - aka dbx is a CLI tool for advanced Databricks jobs management."
arch=(any)
url="https://docs.databricks.com/dev-tools/dbx.html"
license=('CUSTOM')
depends=(
	'python>=3.8'
	"python-databricks-cli>=0.17" "python-databricks-cli<0.18"
	"python-click>=8.1.0" "python-click<9.0.0"
	"python-rich<12.8.0" # Upstream requires 12.5.1, but 12.7.x looks compatible
	"python-typer=0.6.1"
	"python-retry>=0.9.2" "python-retry<1.0.0"
	"python-requests>=2.24.0" "python-requests<3.0.0"
	"python-mlflow>=1.28.0" "python-mlflow<2.0.0" # Upstream requires "python-mlflow-skinny==1.28.0" but it's not available in Arch/AUR
	"python-yaml>=6.0"
	"python-pydantic>=1.9.1"
	"python-cryptography>=3.3.1" "python-cryptography<39.0.0" # Upstream sets 38 as max, but it's backward compatible, so we set 39
	"python-cookiecutter>=1.7.2" "python-cookiecutter<3.0.0"
	"python-jinja>=2.11.2"
	"python-aiohttp>=3.8.1"
	"python-pathspec>=0.9.0"

	"python-watchdog-git>=2.1.0" # The community package is stuck at 0.10.7-3
)
makedepends=(python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::https://github.com/databrickslabs/dbx/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('73d3fc90274282dce038adeb91c8b8051ea9a099c0d06693eb4041b57caf0d8a4a8ca5779436da1cc78b8bd6b7bb8d465c96b2aff13ed8e20acc21ca8dc79521')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
