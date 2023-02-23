# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-dbx
_name=dbx
pkgver=0.8.8
pkgrel=1
pkgdesc="DataBricks CLI eXtensions - aka dbx is a CLI tool for advanced Databricks jobs management."
arch=(any)
url="https://docs.databricks.com/dev-tools/dbx.html"
license=('CUSTOM')
depends=(
	'python>=3.8'
	"python-databricks-cli>=0.17" "python-databricks-cli<0.18"
	"python-click>=8.1.0" "python-click<9.0.0"
	"python-rich<14.0.0" # Upstream requires 12.5.1, but 13.x.x looks compatible
	"python-typer>=0.7.0" "python-typer<1.0.0"
	"python-retry>=0.9.2" "python-retry<1.0.0"
	"python-requests>=2.24.0" "python-requests<3.0.0"
	"python-mlflow>=1.28.0" "python-mlflow<3.0.0" # Upstream requires "python-mlflow-skinny" but it's not available in Arch/AUR
	"python-yaml>=6.0"
	"python-pydantic>=1.9.1" "python-pydantic<=2.0.0"
	"python-cryptography>=3.3.1" "python-cryptography<40.0.0"
	"python-cookiecutter>=1.7.2" "python-cookiecutter<3.0.0"
	"python-jinja>=2.11.2"
	"python-aiohttp>=3.8.1"
	"python-pathspec>=0.9.0"
	"python-watchdog-git>=2.1.0" # The community package is stuck at 0.10.7-3
)
makedepends=(python-build python-installer)
source=($pkgname-$pkgver.tar.gz::https://github.com/databrickslabs/dbx/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('947273ab60ae877b0931cddf881c42cf84a2f8ad4d90cfc4bf2078e515b7cc7968625a64651b9c4017e5c06f10044c6e7124fa39b31b9acf49697bbac6cd0fd4')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
