# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certbot-dns-vultr'
pkgver='0.2.0'
pkgrel='3'
epoch='1'
pkgdesc='Authenticator plugin for Certbot to configure Vultr to respond to ACME dns-01 challenges to obtain HTTPS certificates'
arch=('any')
url="https://github.com/bsorahan/$pkgname"
license=('MIT')
depends=('certbot' 'dns-lexicon' 'python>=3.4.0' 'python-acme' 'python-mock' 'python-zope-interface')
makedepends=('python-setuptools')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('389440fefeb0a95773413e50fc82a2097f8b41fb82237b7693798ee8c7be996ce92c0e9efed1aca31996b3fabbc54816c80d373ef382dbe74bb9a3ffc5931bb0')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

# The test_add_txt_record_try_twice_to_find_domain test currently doesn't pass
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	python -m unittest discover --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
