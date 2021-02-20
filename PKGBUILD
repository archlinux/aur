# Maintainer:  Alex Avance <aravance at gmail dot com>

_pkgname=sparklines
pkgname=python-${_pkgname}
pkgver=0.4.2
pkgrel=2
pkgdesc="Text-based sparkline command line mimicking those of Edward Tuft."
arch=('any')
url="https://github.com/deeplook/${_pkgname}"
license=('GPL3')
depends=('python-future')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7c33fd6dc8b277b1fd729b31428df58a785c68be58202f439128e815f1dcae88')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rf "$pkgdir$site_packages/test"
}
