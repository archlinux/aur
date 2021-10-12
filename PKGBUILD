# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=python-tikzplotlib
pkgver=0.9.14
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
license=('MIT')
arch=('any')
url="https://github.com/nschloe/tikzplotlib"
depends=('python>=3.8' 'python-matplotlib>=1.4.0' 'python-pillow' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pandas' 'python-pytest-randomly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "setup.py")
sha256sums=('63b54d0c49f5248371af79dd304e7fcb2a6ce77d48c03b6c2ca5576b94d38ed6'
            '76189f7511a9eb8dab0ccaf022097f598fa32c3026ce2c2174ea7e7c3fccc71e')

prepare() {
	cp setup.py "tikzplotlib-$pkgver"
}

build() {
	cd "tikzplotlib-$pkgver"
	python setup.py build
}

check() {
	cd "tikzplotlib-$pkgver"
	python setup.py pytest
}

package() {
	cd "tikzplotlib-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
