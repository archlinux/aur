# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=ixia
pkgname="python-$_pkgname"
pkgver=1.1.0
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
sha512sums=('dfc5b801b1ea61df4d992dc73b637f20aad737506f6fcaa89e59a8ba8ce9fbc39230e485ae40c9d265be422b4dbde6f03ace997e2485947c6dbb44c9f93d8a52')

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
