# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-parllama
_pkgname=parllama
pkgver=0.9.2
pkgrel=1
pkgdesc="Terminal UI for Ollama and other LLM providers (Textual-based TUI)"
arch=('any')
url="https://github.com/paulrobello/parllama"
license=('MIT')
depends=('python' 'python-httpx' 'python-pillow' 'python-pydantic' 'python-dotenv' 'python-pytz' 'python-requests' 'python-rich' 'python-textual' 'python-orjson')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
_tag="v0.9.2"
_srcdir="parllama-0.9.2"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/paulrobello/parllama/tar.gz/refs/tags/$_tag")
sha256sums=('2c2bb92eff73db90a658cb18c5d9138fc944f6edee332ac1263d8ffde8463de2')
function build() {
	cd "$_srcdir"
	rm -rf dist
	python -m build --wheel --no-isolation
}
function package() {
	cd "$_srcdir"
	python -m installer --no-compile --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
