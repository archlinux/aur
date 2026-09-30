# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-configdrift
pkgver=0.1.0
pkgrel=1
pkgdesc="Detect and fix configuration file drift across environments (YAML, JSON, TOML, .env)"
arch=('any')
url="https://github.com/Coding-Dev-Tools/configdrift"
license=('MIT')
depends=('python' 'python-typer' 'python-rich' 'python-yaml' 'python-tomli-w')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('045633fc5e7dc4e5f13b2922c25843531e5f176a13971f01a9f48dde5108ca7d')

build() {
	cd "configdrift-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "configdrift-$pkgver"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "configdrift-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
