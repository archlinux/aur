# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Bram Neijt <bram at neijt dot nl>

pkgname=autotrash
pkgver=0.4.6
pkgrel=1
pkgdesc='Tool to automatically purge old trashed files'
arch=(any)
url="https://github.com/bneijt/$pkgname"
license=(GPL3)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('cfa59d025bb37ee31f0726e7f218f328af7e51c34de606fac384a342bd3e73761b313a3b71c4b2f3130125997640d5f18bd97ac6885d092749fc9e46aac744d5')

build() {
	cd ..
	[ -f .gitignore ] && mv .gitignore .gitignore.tmp

	pushd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation

	popd
	[ -f .gitignore.tmp ] && mv .gitignore.tmp .gitignore || true
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
