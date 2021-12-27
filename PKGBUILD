# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=python-tikzplotlib
pkgver=0.9.17
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
license=('MIT')
arch=('any')
url="https://github.com/nschloe/tikzplotlib"
depends=('python>=3.8' 'python-matplotlib' 'python-pillow' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pandas' 'python-pytest-randomly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "setup.py")
sha256sums=('a42bd1a61687f322b69c3a1e01b30678bb9bd4c11a09fc1eaa5f59cb07ea9d9a'
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
