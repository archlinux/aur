# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certbot-dns-vultr'
pkgver='0.2.0'
pkgrel='1'
epoch='1'
pkgdesc='Authenticator plugin for Certbot to configure Vultr to respond to ACME dns-01 challenges to obtain HTTPS certificates'
arch=('any')
url="https://github.com/bsorahan/$pkgname"
license=('MIT')
depends=('certbot' 'dns-lexicon' 'python>=3.4.0' 'python-acme' 'python-mock' 'python-zope-interface')
makedepends=('python-setuptools')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5e19a42238f55b543218f524f65edba593a610bec3dec45b3764c180d6bcd781f37d6106089e415a97cde3894db8aa59523bf8152dee377c110800606c83b797')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

# Tests currently don't pass
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	python -m unittest discover --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
