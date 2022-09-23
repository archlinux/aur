# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=dahlia
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A dynamic, interpreted language that is transpiled to Python"
arch=(any)
url="https://github.com/trag1c/Dahlia"
license=('MIT')
depends=('python>=3.8' 'python-argparse')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=()
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('7f747da61797ab2f81b6c77ce80b09275b6bf66add2204212f468a5cc8470e81')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-dahlia/LICENSE"
}
