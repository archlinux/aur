# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('python-sentry_sdk' 'python2-sentry_sdk')
_pkgname=sentry-sdk
pkgver=0.13.3
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
sha256sums=('e3302e8df82e68599eeeef564f08d15aa62efc1cb013d8e1cccc5bf526d375a4'
            '59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c')
            
prepare() {
	cp -a "$_pkgname-$pkgver"{,-py2}
}
            
build() {
	cd "$srcdir/$_pkgname-$pkgver" 
	python setup.py build
	
	cd "$srcdir/$_pkgname-$pkgver-py2"
	python2 setup.py build
}

package_python-sentry_sdk() {
	depends=('python-urllib3' 'python-certifi')
	optdepends=('python-flask' 'python-blinker' 'python-bottle' 'python-falcon')

	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-sentry_sdk() {
	depends=('python2-urllib3' 'python2-certifi')
	optdepends=('python2-flask' 'python2-blinker' 'python2-bottle' 'python2-falcon')

	cd "$_pkgname-$pkgver-py2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
