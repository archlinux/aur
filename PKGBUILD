# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=ixia
pkgname="python-$_pkgname"
pkgver=1.2.0
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
sha512sums=('bb87633e4b55bf7d60c2a49da1e3133f7efd6b28e028bdc02b966a26e043fadfb86c1c86ace489b91ef39a2552c833996963c8cc822c6c83eba0aae8771969a9')

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
