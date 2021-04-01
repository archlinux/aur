# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.10
pkgrel=1
pkgdesc='Scriptable debugger library'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('GPL3')
depends=('libelf' 'libkdumpfile' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('91a0eec19f1569dffd764b200906e0bd5ea553faa2f4060184a6c0a41675c022')

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
