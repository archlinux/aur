# Maintainer: Groctel <aur@taxorubio.com>

_name=mapbox_earcut_python

pkgname=python-mapbox-earcut
pkgver=1.0.1
pkgrel=1
pkgdesc="Python bindings for the C++ implementation of the Mapbox Earcut library."

arch=('any')
license=('custom')
url="https://github.com/skogler/mapbox_earcut_python"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('cdb32585cbaf74c15e59af0ae70d983dd2f9bc9cfe1b59b3eadc4d442f7d962241854b589a035deae67cacd9334833b911d0981f0d417fe587348fc7d24f0c0a')

depends=('python')
makedepends=(
	'cmake'
	'git'
	'pybind11'
	'python-pip'
	'python-setuptools'
)

prepare ()
{
	cd "$srcdir/$_name-$pkgver"
	git clone https://github.com/pybind/pybind11
}

build ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
