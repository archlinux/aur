# Maintainer:
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Michał Sałaban <michal at salaban dot info>
pkgname=python2-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.13.5
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
depends=('python2-urllib3' 'python2-certifi')
makedepends=('python2-setuptools')
optdepends=('python2-flask' 'python2-blinker' 'python2-bottle' 'python2-falcon')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
sha256sums=('c6b919623e488134a728f16326c6f0bcdab7e3f59e7f4c472a90eea4d6d8fe82'
            '59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
