# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-lynxpresence
_name=${pkgname#python-}
pkgver=4.6.2
pkgrel=1
pkgdesc='Discord RPC and Rich Presence wrapper library'
url='https://github.com/C0rn3j/lynxpresence'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-sphinx
	python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5ecb6d6e233bb5c155025c3ee2e0244fa0fe4c68d70c2f88056277d9f3eee405c1a751eda681470767477a3cd2a789699d174a3b077b6ce9a748b88717aebece')

build() {
	cd $_name-$pkgver

	python -m build --wheel --no-isolation
	sphinx-build -b man docs/sphinx man
}

package() {
	cd $_name-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl
	mv man/pypresence.1 man/lynxpresence.1
	install -Dm644 -t "$pkgdir"/usr/share/man/man1 man/lynxpresence.1
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
