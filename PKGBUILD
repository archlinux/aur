# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=ec
pkgver=0.1.0
pkgrel=1
pkgdesc='A desk calculator with vectors and quotations'
arch=('x86_64')
url='https://git.sr.ht/~subsetpark/ec'
depends=('janet')
license=('BSD3')
provides=('ec')

source=("${url}/archive/v${pkgver}.tar.gz")

sha256sums=('d353ccd1c1d243153512084e4032cc87a89b164c67adf02b55f8b0fbabbf6882')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        mkdir janet_modules
        JANET_PATH=janet_modules jpm load-lockfile
        JANET_PATH=janet_modules jpm build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 "build/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
