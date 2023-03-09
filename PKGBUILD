# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=dahlia
pkgname=python-$_pkgname
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc='A simple text formatting package, inspired by the game Minecraft.'
arch=(any)
url='https://github.com/trag1c/Dahlia'
license=('MIT')
depends=('python>=3.8' 'python-argparse')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('7b15fb8c0e6eb46fe817a71813a1929d5549afa22556750b6b60611afd90cb89fa79451d9c878286478926df5ec3ac32efc1824c4fa961fa782ef63ca08dacb3')

build() {
	cd ..
	[ -f .gitignore ] && mv .gitignore .gitignore.tmp

	pushd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation

	popd
	[ -f .gitignore.tmp ] && mv .gitignore.tmp .gitignore || true
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
