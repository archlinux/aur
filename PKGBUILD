# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=ixia
pkgname="python-$_pkgname"
pkgver=1.3.2
pkgrel=1
epoch=
pkgdesc="A library connecting secrets' security with random's versatility"
arch=(any)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'git')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('4a46fd66f22ca04f6530d610a468762d4f21c42375e1ccf72c5c64d8a49a32da9b3dff4df9934cd839274f73c1f9c16a754c4610ed1de9898eb96b157ff38df5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	git init -b master  # prevent poetry from looking for parent .gitignores
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
