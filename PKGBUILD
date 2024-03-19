# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=3.2.0
pkgrel=1
pkgdesc='A simple CLI for Vikunja'
arch=('any')
url='https://gitlab.com/ce72/vja'
license=('GPL-3.0-or-later')
depends=('python'
				 'python-click'
				 'python-click-aliases'
				 'python-requests'
				 'python-parsedatetime'
				 'python-dateutil'
				)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
				'0001-Remove-reference-to-readme.md.patch')
sha1sums=('cd4b07df7dd9c170ee90ac2f8dd4ea9a44df5986'
					'ec72120aeebf52b333604bf99954b9f9bcd18cbd')
sha256sums=('b206c717ce82fe43fa410038ea4fa980c83df99ef544e375e703a33cd0d40382'
						'1aff23e6f03ba58d6a18efacc8b9392a45272f331152d08a99bb525c792f8faa')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-Remove-reference-to-readme.md.patch"
	rm -r tests/
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --skip-build --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
