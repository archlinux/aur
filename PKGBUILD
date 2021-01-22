# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=bagatto
pkgver=0.4.0
pkgrel=1
pkgdesc='A transparent, extensible static site generator'
arch=('x86_64')
url='https://bagatto.co/'
depends=('janet')
license=('BSD3')
provides=('bagatto')

source=("https://git.sr.ht/~subsetpark/bagatto/archive/v${pkgver}.tar.gz")

sha256sums=('06e138836061b4b2f23c1ba7c78f233c69d019b1667979b5627c783d8c419529')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        mkdir janet_modules
        JANET_PATH=janet_modules jpm load-lockfile
        JANET_PATH=janet_modules jpm build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 build/bag "${pkgdir}/usr/bin/bag"
}
