# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: swiftscythe
pkgname=python-nuvolasdk
_pkgname=${pkgname#python-}
pkgver=4.20.0
pkgrel=2
pkgdesc="SDK for building Nuvola web app scripts for Nuvola Apps Runtime."
arch=('any')
url="https://github.com/tiliado/nuvolasdk"
license=('BSD')
depends=('python-pillow')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a318be164bf468546260b29ea34963e5e8d9b7f21b5c340d0b3d2fc524489b53')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
