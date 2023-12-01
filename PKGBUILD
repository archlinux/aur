# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.25
pkgrel=1
pkgdesc='Programmable debugger'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('LGPL2.1')
depends=('libelf' 'libkdumpfile' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('42dc13ac73d3d06bab76c676b2d103a2a6a0f1a1969e02e6769727049e1bdd02')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -d "$pkgdir/usr/share/drgn"
	cp -dR --no-preserve=ownership contrib tools "$pkgdir/usr/share/drgn"
}
