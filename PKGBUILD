# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=(gambit python-pygambit)
pkgver=16.3.0
pkgrel=1
pkgdesc="Tools for doing computation in game theory"
arch=('i686' 'x86_64')
url='https://github.com/gambitproject/gambit'
license=('GPL-2.0-or-later')
depends=('gcc-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'cython')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d72e991ce935a3dc893947c413410348e2c2eb9cd912ec3b083699a4ccae4d77')

build() {
	cd "$pkgname-$pkgver"

	aclocal
	libtoolize
	automake --add-missing
	autoconf
	./configure --prefix=/usr --disable-enumpoly
	make

	python -m build --wheel --no-isolation
}

package_gambit() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

package_python-pygambit() {
	depends+=('python-numpy' 'python-scipy')
	cd "$pkgbase-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
