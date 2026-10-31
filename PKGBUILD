# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-wheelripe
_pkgname=wheelripe
pkgver=0.1.0
pkgrel=1
_repo=wheelripe
_tag=v0.1.0
_srcdir="$_repo-$pkgver"
pkgdesc="Before you move to a new Python (3.15, free-threaded 3.15t), find every locked dependency with no wheel for it on your platforms and the smallest bump that fixes each. CLI, GitHub Action, MCP"
arch=('any')
url="https://blackman99.github.io/wheelripe/"
license=('MIT')
depends=('python' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Blackman99/wheelripe/archive/refs/tags/$_tag.tar.gz")
sha256sums=('6f9cf5fb01ea1c0455f67f17b8e2e873e59cf3978b5142cc57e0c7405f9c609e')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
