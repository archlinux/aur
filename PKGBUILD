# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-privy-git
pkgver=r67.624bb58
pkgrel=1
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('i686' 'x86_64')
url="https://github.com/ofek/privy"
license=('dual')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('python-setuptools')
provides=('python-privy')
source=("$pkgname"::'git+https://github.com/ofek/privy.git'
        "LICENSE-MIT"
        "LICENSE-APACHE")
md5sums=('SKIP'
         '388b1e32639feccde602f679e55f1e26'
         'c095d68fd956360d26e013d3f3739e94')

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
