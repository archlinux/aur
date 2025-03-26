# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-dbx
_name=dbx
pkgver=0.8.19
pkgrel=1
pkgdesc="DataBricks CLI eXtensions - aka dbx is a CLI tool for advanced Databricks jobs management."
arch=(any)
url="https://docs.databricks.com/dev-tools/dbx.html"
license=('CUSTOM')
depends=(
	'python>=3.8'
	"python-databricks-cli>=0.17" "python-databricks-cli<0.19"
	"python-click>=8.1.0" "python-click<9.0.0"
	"python-rich<=14.0.0" # Upstream requires 12.5.1, but 13.x.x looks compatible
	"python-typer>=0.7.0" "python-typer<1.0.0"
	"python-tenacity>=8.2.2" "python-tenacity<10.0.0"
	"python-requests>=2.30.0" "python-requests<3.0.0"
	"python-mlflow>=2.0.0" "python-mlflow<3.0.0" # Upstream requires "python-mlflow-skinny" but it's not available in Arch/AUR
	"python-yaml>=6.0"
	"python-pydantic>=1.10.8" "python-pydantic<3.0.0" # Upstream requires <2.0.0
	"python-cryptography>=42.0.8"
	"python-cookiecutter>=2.1.0" "python-cookiecutter<3.0.0"
	"python-jinja>=2.11.2"
	"python-aiohttp>=3.8.1"
	"python-pathspec>=0.9.0"
	"python-watchdog>=2.1.0"
	"python-yaml>=6.0"
)
optdepends=(
	"python-azure-storage-blob>=12.14.1" "python-azure-storage-blob<13.0.0"
	"python-azure-identity>=1.12.0" "python-azure-identity<2.0.0"
	"python-boto3>=1.26.13" "python-boto3>=1.26.13"
	"python-google-cloud-storage>=2.6.0" "python-google-cloud-storage<3.0.0"
)
makedepends=(python-build python-hatchling python-hatch-vcs python-installer)
source=($pkgname-$pkgver.tar.gz::https://github.com/databrickslabs/dbx/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('09a59ff02b941c2ae224d11c6933379058c7c4dbff7d117049acf4ab6fe02a7ac87816fbc08735a189c1c45daf9fd1a4012bfaba155a6eaf15fbf97a010f7674')
install="${pkgname}.install"

build() {
	cd "$_name-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
