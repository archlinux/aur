# Maintainer: Timothy Gu <timothygu99@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=8.0.4
pkgrel=1
epoch=
pkgdesc="Python Bindings for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD')
depends=('nvidia-utils' 'python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c8d4eadc648c7e12a3c9182a9750afd8481b76412f83747bcc01e2aa829cde5d')

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
	sed -n '/Copyright/,$p' README.md > LICENSE
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
