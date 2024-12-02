# Maintainer: Timothy Gu <timothygu99@gmail.com>
# Maintainer: Blyss Sarania <blyss.sarania@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=12.0.0
pkgrel=1
epoch=
pkgdesc="Python utilities for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD')
depends=('nvidia-utils' 'python' 'python-nvidia-ml-py')
makedepends=('python-build' 'python-installer')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('299ce2451a6a17e6822d6faee750103e25b415f06f59abb8db65d30f794166f5')

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation --outdir dist
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
