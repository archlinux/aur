# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-mapbox-earcut
_name=mapbox_earcut_python
pkgver=0.12.10
pkgrel=2
pkgdesc="Python bindings for the C++ implementation of the Mapbox Earcut library."
arch=('any')
url="https://github.com/skogler/mapbox_earcut_python"
license=('custom')
depends=(
	'python'
)
makedepends=(
	'cmake'
	'git'
	'pybind11'
	'python-pip'
	'python-setuptools'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e7f5a174dfdee121737004240ca55dba5abc3466b5ef158411ad54955074fbab756cb0b468a2d6377b9aa8b990522ce47c1bfdf1eb611e55f8efcd3909c37424')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	git clone https://github.com/pybind/pybind11
	sed -i 's/add_subdirectory(pybind11)/find_package(pybind11 CONFIG)/' CMakeLists.txt
}

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

