# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('python-sentry_sdk' 'python2-sentry_sdk')
pkgbase=python-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.13.0
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
sha256sums=('ff14935cc3053de0650128f124c36f34a4be120b8cc522c149f5cba342c1fd05'
            '59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c')
            
prepare() {
	cp -a "$_pkgname-$pkgver"{,-py2}
}
            
build() {
	cd "$_pkgname-$pkgver" 
	python setup.py build
	
	cd .. && cd "$_pkgname-$pkgver-py2"
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

	cd "$_pkgname-$pkgver-py2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
