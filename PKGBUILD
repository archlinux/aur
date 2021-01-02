# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=bagatto
pkgver=0.3.1
pkgrel=1
pkgdesc='A transparent, extensible static site generator'
arch=('x86_64')
url='https://bagatto.co/'
depends=('janet')
license=('BSD3')
provides=('bagatto')

source=("https://git.sr.ht/~subsetpark/bagatto/archive/v${pkgver}.tar.gz")

sha256sums=('efd41ffd1140367bf7591a609e19bbb51c82a097605daa31670fd244c3dec739')

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
