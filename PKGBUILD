# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('python-sentry_sdk' 'python2-sentry_sdk')
pkgbase=python-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.12.0
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/getsentry/sentry-python/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
sha256sums=('13e58855d6e347f8545c7f18ae4db3d56639540f21e4476d94c8fc16a0af57ca'
            '59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c')
            
build() {
	cd "$_pkgname-$pkgver" 
	python setup.py build
	python2 setup.py build
}

package_python-sentry_sdk() {
	depends=('python-urllib3' 'python-certifi')
	optdepends=('python-flask' 'python-blinker' 'python-bottle' 'python-falcon')

	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sentry_sdk() {
	depends=('python2-urllib3' 'python2-certifi')
	optdepends=('python2-flask' 'python2-blinker' 'python2-bottle' 'python2-falcon')

	cd "$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
