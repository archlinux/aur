# Maintainer: Bram Neijt <bram at neijt dot nl>
# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=autotrash
pkgver=0.4.5
pkgrel=1
pkgdesc='Tool to automatically purge old trashed files'
arch=(any)
url="https://github.com/bneijt/$pkgname"
license=(GPL3)
depends=('python' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('747b503eeebd4974aea3b0fb093f31a40ddac32b2cafa355a2fe1276ce48f134a8b017354cf20513e6a28bd1c4cc485f385d85ad4d38972ec362bfb1a28cc25c')

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
