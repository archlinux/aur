# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

## this package requires vamp-plugin-sdk source files for whatever reason

pkgname=vampy-host
pkgver=1.1.0
pkgrel=1
_commit=1a158318bd95d02dc2b60a383f882a128394d991
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/vamp-plugins/vampy-host"
license=('MIT')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/${_commit}.tar.gz"
	"vamp-plugin-sdk-2.10.tar.gz::https://github.com/vamp-plugins/vamp-plugin-sdk/archive/vamp-plugin-sdk-v2.10.tar.gz")
sha256sums=('1eb7dd3f4a88ce7469f9cc99cfb84d176d98fac3f6a0c9a5e3ecc9f3422d3f93'
            'b552bc91817294c7f90ea07d70938642ebf15d5e3bafc81cf7d55efab9995399')

prepare() {
	mv "$srcdir/vamp-plugin-sdk-vamp-plugin-sdk-v2.10/" "$srcdir/$pkgname-${_commit}/vamp-plugin-sdk"
}

build() {
	cd "$pkgname-$_commit"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$_commit"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
