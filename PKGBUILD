# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=dahlia
pkgname=python-$_pkgname
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc='A simple text formatting package, inspired by the game Minecraft.'
arch=(any)
url='https://github.com/trag1c/Dahlia'
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('ed8862ea13025e7a71be8f0620c12b1d70a639c0235af66a4cf5cf2759632b36ab6f2abed305e2090bc2270f91234d02a6dcc78e5ace24757ca39400288d530f')

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
