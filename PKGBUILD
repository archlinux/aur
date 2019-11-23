# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-privy-git
pkgver=r67.624bb58
pkgrel=5
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('any')
url="https://github.com/ofek/privy"
license=('dual')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ofek/privy.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE-APACHE"
}
