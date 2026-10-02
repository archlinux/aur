# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=catdir
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI utility that traverses directories and concatenates the contents of all files within a folder and its subfolders, like cat but for entire directory trees"
arch=('any')
url="https://github.com/emilastanov/catdir"
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba7cde415cb1c4f392f02378cb2fd404e10693d22c67e1bf7aa123db1e2f8fed')

build() {
	cd "catdir-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "catdir-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
