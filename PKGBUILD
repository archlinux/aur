# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=paperbush
pkgname="python-$_pkgname"
pkgver=0.2.0
pkgrel=3
pkgdesc='Super concise argument parsing tool'
arch=(any)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('7947e21b1284292027d56c1d77ebf1e7dedf46108b52c5d9540946633cc036e6c600e9f29ff048d850859eba158c517a449ef433def03fa235a72ee98c23fa2b')

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
