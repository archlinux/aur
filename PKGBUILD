# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=drgn
pkgver=0.0.9
pkgrel=1
pkgdesc='Scriptable debugger library'
arch=('x86_64')
url='https://github.com/osandov/drgn'
license=('GPL3')
depends=('bzip2' 'libkdumpfile' 'python' 'xz' 'zlib')
makedepends=('gawk' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1571ec9a03ea019880e145cc46f9ff9aed613c0ad3e5e56c1e818f808811b03c')

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
