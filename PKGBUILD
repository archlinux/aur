# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=nbcat
pkgver=1.0.0
pkgrel=1
pkgdesc="Preview Jupyter notebooks (.ipynb) in the terminal"
arch=('any')
url="https://github.com/akopdev/nbcat"
license=('MIT')
depends=('python' 'python-rich' 'python-nbformat')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v1.0.0"
_srcdir="nbcat-1.0.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/akopdev/nbcat/tar.gz/refs/tags/$_tag")
sha256sums=('da5c83144d65e1be5b0179eb9530187db2fdc2a2839cfff06327846817ad2762')
function build() {
	cd "$_srcdir"
	rm -rf dist
	python -m build --wheel --no-isolation
}
function package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
