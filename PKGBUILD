# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.26
pkgrel=1
pkgdesc='Programmable debugger'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('LGPL2.1')
depends=('libelf' 'libkdumpfile' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a7ccbf72acea32dda8b431e9a5817d1c410e734a471d261eedd59a20c4727929')

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
