# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Weiman <mark dot weriman at markzz dot com>

pkgname=python-evtx
pkgver=0.7.4
pkgrel=1
pkgdesc="Pure Python parser for Windows Event Log Files"
arch=('any')
license=('Apache')
url='https://github.com/williballenthin/python-evtx'
depends=('python-six' 'python-hexdump')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner' 'python-pytest-cov' 'python-lxml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ecf3c1736ec9e080ddd1c64b6dad23c756e20d54bd30acc21245b9706258fdd9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

## requires an older version of pytest
# check() {
# 	cd "$pkgname-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
