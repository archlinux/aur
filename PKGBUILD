_pkgname=gpxpy
pkgname="python-$_pkgname"
pkgver=1.6.2
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=(Apache)
depends=('python>=3.2' 'python-lxml>=3.1.2')
makedepends=(python-setuptools python-{build,installer,wheel})
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ae9523ba4ea7ebe40b2d769800262f102cde924286a08b559d0f9476119717d3')

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
