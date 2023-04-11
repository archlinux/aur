# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-dbx
_name=dbx
pkgver=0.8.10
pkgrel=2
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
	"python-tenacity>=8.2.2" "python-tenacity<9.0.0"
	"python-requests>=2.24.0" "python-requests<3.0.0"
	"python-mlflow>=1.28.0" "python-mlflow<3.0.0" # Upstream requires "python-mlflow-skinny" but it's not available in Arch/AUR
	"python-yaml>=6.0"
	"python-pydantic>=1.9.1" "python-pydantic<=2.0.0"
	"python-cryptography>=3.3.1" "python-cryptography<41.0.0"
	"python-cookiecutter>=1.7.2" "python-cookiecutter<3.0.0"
	"python-jinja>=2.11.2"
	"python-aiohttp>=3.8.1"
	"python-pathspec>=0.9.0"
	"python-watchdog>=2.1.0"
)
optdepends=(
	"python-azure-storage-blob>=12.14.1" "python-azure-storage-blob<13.0.0"
	"python-azure-identity>=1.12.0" "python-azure-identity<2.0.0"
	"python-boto3>=1.26.13" "python-boto3>=1.26.13"
	"python-google-cloud-storage>=2.6.0" "python-google-cloud-storage<3.0.0"
)
makedepends=(python-build python-installer)
source=($pkgname-$pkgver.tar.gz::https://github.com/databrickslabs/dbx/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('0d698ac6d21228c93d69164a4461e6f28248c1c66c0a694bd23fe8fc121ec171ae40d5c2bc1a880418e3d78137ccd4e84c667cbb93c4c65bfc4648fe3a16ff9e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
