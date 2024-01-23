# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='python-inputmodule'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Python-based command line utility and library to control Framework Laptop 16 input modules'
arch=('any')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
depends=('inputmodule-udev' 'python>=3.7.0' 'python-getkey' 'python-pillow' 'python-pyserial' 'python-pysimplegui')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer' 'python-wheel')
provides=('ledmatrixctl' 'ledmatrixgui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('068f26d83ee68e6e1b71954add4a9df740426596f3f6301cb5f24b898e17d41f70f1d3245afe6e2b601e09a72c8dfb868fae65f8a9e9c439cde40eddbd8a47a9')

_sourcedirectory="$_projectname-$pkgver/python"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
