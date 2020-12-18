# Maintainer: leuko <leuko_aydos_de>
_py=ipycanvas
pkgname=python-$_py-git
provides=("${pkgname%-git}")
pkgver=r297.0cc98b4
pkgrel=1
pkgdesc="Interactive widgets library exposing the browser's Canvas API"
arch=(any)
url="https://github.com/martinRenou/ipycanvas"
license=(BSD)
depends=(
	python
	python-setuptools
	python-ipywidgets
	python-pillow
	python-numpy
	python-orjson
	jupyter
	jupyterlab
)
makedepends=(python-setuptools git)
source=("git+$url")
md5sums=('SKIP')
pkgver() {
	cd $_py
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd $_py
	python setup.py build
}
package() {
	cd $_py
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 $(find LICENSE*|head -1) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
install=${pkgname%-git}.install
