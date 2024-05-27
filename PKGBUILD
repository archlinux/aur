# Maintainer: Jax Young <jaxvanyang@gmail.com>
_name=pysgf
pkgname="python-$_name"
pkgver=0.8.0
pkgrel=1
pkgdesc="Simple SGF parser"
arch=('any')
url="https://pypi.org/project/pysgf"
license=('MIT')
depends=('python>=3.6')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"$pkgname-$pkgver.patch")
sha256sums=('123d987495c227dfb52a0e1cd73773868b780f20140777f185cec7bb0018a529'
	'6a13ec77e4fbce2e692a1868b791b54ac7f01fcc303c2f90beadcbd3d9f16bbe')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
