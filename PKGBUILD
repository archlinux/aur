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
sha256sums=('SKIP'
            'd502748a33db7ade1318e37f0b5f219f478330ed74a673e387756e53fb516715'
            'cebfb5eab4eff50df87c3c5e7eb11a634d0fa32bb4b6380800f82fae606599ae')

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
