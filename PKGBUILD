# Maintainer: Philipp A. <flying-sheep@web.de>

_name=web-pdb
pkgname=python-$_name
pkgver=1.6.3
pkgrel=1
pkgdesc='Web interface for Python’s built-in PDB debugger.'
arch=(any)
url="https://github.com/romanvm/$pkgname"
license=(MIT)
depends=(python python-bottle python-asyncore-wsgi)
#checkdepends=(python-selenium)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cc8169d5b0edfd6090029bc7452a2928786dbcad9dc9f228e8eb45351b88f6e9')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
