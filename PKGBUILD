# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-nerd-color
_pkg=Nerd-Color
pkgver=0.1.0
pkgrel=2
pkgdesc="Simple CLI colorizer"
arch=('any')
url="https://github.com/0xharu/nerd-color"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('7e234e89ee016cf5a592cc8cf8e01c1ed42eae3c38b82236e18525180b4a2864')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
