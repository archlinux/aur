_pkgname=gpxpy
pkgname="python-$_pkgname"
pkgver=1.6.0
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=(Apache)
depends=('python>=3.2' 'python-lxml>=3.1.2')
makedepends=(python-setuptools python-{build,installer,wheel})
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2122d2d156d87bb1c128f968a746f6e2703983c831c7f21778e83b026c9debe9')

build () {
	cd $_pkgname-$pkgver
	python -m build -wn
}

check() {
	cd $_pkgname-$pkgver
	python -m unittest test
}

package() {
	cd $_pkgname-$pkgver
	python -m installer -d "$pkgdir" dist/*.whl
}
