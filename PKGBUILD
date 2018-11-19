# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-privy-git
pkgver=r67.624bb58
pkgrel=2
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('any')
url="https://github.com/ofek/privy"
license=('dual')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('python-setuptools')
provides=('python-privy')
source=("$pkgname"::"git+$url.git"
        "$url/blob/master/LICENSE-MIT"
        "$url/blob/master/LICENSE-APACHE")
md5sums=('SKIP'
         'b7160396ff595e32809929d658725f44'
         '97780513e711a2722777c45a835265d5')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	python setup.py install --root="$pkgdir/"
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
