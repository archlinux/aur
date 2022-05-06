# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Payson Wallach <payson@paysonwallach.com>

_name=TakeTheTime
pkgname=python-takethetime
pkgver=0.3.1
pkgrel=3
pkgdesc="Time-taking library for Python."
arch=('any')
url="https://github.com/ErikBjare/TakeTheTime"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('dbe30453a1b596a38f9e2e3fa8e1adc5af2dbf646ca0837ad5c2059a16fe2ff9'
            'd0d27338849d3a12a8d8a8fe790250025837703e6ca597ee84ffbcf740105c43')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
