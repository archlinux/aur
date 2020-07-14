# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.5
pkgrel=1
pkgdesc='Scriptable debugger library'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('GPL3')
depends=('bzip2' 'libkdumpfile' 'python' 'python-setuptools' 'xz' 'zlib')
makedepends=('gawk')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6edc6ef14d083b73bdc3ea7a65fcf642925e4ef355bf1d3b584b04d57e36f0c3')

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
	cp -dR --no-preserve=ownership examples tools "$pkgdir/usr/share/drgn"
}
