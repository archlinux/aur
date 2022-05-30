# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=pipe
pkgname=python-$_pkgname
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="A Python library to use infix notation in Python "
arch=(any)
url="https://github.com/JulienPalard/Pipe"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' ) #'python-setuptools' 'python-wheel')
source=(
	"$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('a1cf3f29f98576b7e6552231142bc711e8dd324513a2c4525fc68c33f47fabad')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel #--no-isolation
	# --no-isolation temporarily omitted since current version of
	# python-setuptools in arch repos is outdated and does not work for this
	# build
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
