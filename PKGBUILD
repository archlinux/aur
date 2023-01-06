# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.22
pkgrel=1
pkgdesc='Programmable debugger'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('LGPL2.1')
depends=('libelf' 'libkdumpfile' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('62bd8a7f6398d30c3fabb3fd7212423aaf967ba1b53cc7783ed55847ea94e1aa')

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
