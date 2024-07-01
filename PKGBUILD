# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.27
pkgrel=1
pkgdesc='Programmable debugger'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('LGPL2.1')
depends=('libelf' 'libkdumpfile' 'python')
makedepends=('python-setuptools')
checkdepends=('check')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4e44a14bc0b9ba4517029584f3875827be07f757dddd9326f3b7f388dc51e05a')

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
	find "$pkgdir/usr/share/drgn" -name '*.pyc' -delete
}
