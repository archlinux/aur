# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-privy-git
pkgver=r67.624bb58
pkgrel=4
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('any')
url="https://github.com/ofek/privy"
license=('dual')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('python-setuptools')
provides=('python-privy')
source=("$pkgname"::'git+https://github.com/ofek/privy.git'
        "https://raw.githubusercontent.com/ofek/privy/master/LICENSE-MIT"
        "https://raw.githubusercontent.com/ofek/privy/master/LICENSE-APACHE")
md5sums=('SKIP'
         '388b1e32639feccde602f679e55f1e26'
         'c095d68fd956360d26e013d3f3739e94')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
    python setup.py build
}

package() {
	cd "$srcdir/${pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
