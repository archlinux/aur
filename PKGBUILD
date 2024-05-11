# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Bram Neijt <bram at neijt dot nl>

pkgname=autotrash
pkgver=0.4.7
pkgrel=1
pkgdesc='Tool to automatically purge old trashed files'
arch=(any)
url="https://github.com/bneijt/$pkgname"
license=(GPL3)
depends=('python>=3.8')
makedepends=('python-build'
             'python-installer'
             'python-poetry-core'
             'pandoc-cli'
             'git')
source=("$pkgname::git+https://github.com/bneijt/$pkgname.git#tag=$pkgver")
sha512sums=('4735ffc89d56c3913075b4203e41d6dca70e13e85e9c6905327b1a38f5ad873f581b6b4dd179197d50d7a96547ce8b778b8380f7cdf0f3b4c944fc525b156f7e')

build() {
	cd "$srcdir/$pkgname"
	python -m build --wheel --no-isolation
	make -C doc "$pkgname.1"
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "doc/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
