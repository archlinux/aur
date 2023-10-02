# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=ixia
pkgname="python-$_pkgname"
pkgver=1.3.1
pkgrel=1
epoch=
pkgdesc="A library connecting secrets' security with random's versatility"
arch=(any)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('2eb909a3635da56fe497871e47931cb78205a0d1cf6a025022521dc34e68dca820182ddb43fa6afd13ab247766505df2ce67ce14bea741330a0fe512a0cc72a6')

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
