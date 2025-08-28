# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-lynxpresence
_name=${pkgname#python-}
pkgver=4.4.1
pkgrel=3
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
b2sums=('5ed8884030c9d6051763959502c2ab005dccb468daeb8ae2e174b7b4e9efb7be6f1cff5b1e8a2a289f312b7b5d0dd8a585f52a18bcbcc46a356956dbb19f0fb6')

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
