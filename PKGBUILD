# Maintainer: Groctel <aur@taxorubio.com>

_name=mapbox_earcut_python

pkgname=python-mapbox-earcut
pkgver=1.0.0
pkgrel=1
pkgdesc="Python bindings for the C++ implementation of the Mapbox Earcut library."

arch=('any')
license=('custom')
url="https://github.com/skogler/mapbox_earcut_python"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8f3687ac11497ad73c2a3dd1d1203dccf655da623d1638e638978a59388e0c057ca6f895782b609d59a2a4be478d6daf2294523a946c8a5d232dcfe718e4eec9')

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
