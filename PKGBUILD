# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-supersmoother
pkgver=0.4
pkgrel=1
pkgdesc="Python implementation of Friedman's Supersmoother"
url="https://github.com/jakevdp/supersmoother"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('439ddf5e19e134dc65af46a2c1701aea3702026d717776def35dc5fce972cb0b')

prepare() {
	cd "supersmoother-$pkgver"
	sed -i '/supersmoother.tests/d' setup.py
}

build() {
	cd "supersmoother-$pkgver"
	python setup.py build
}

package() {
	cd "supersmoother-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
