# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=bagatto
pkgver=0.2.0
pkgrel=1
pkgdesc='A transparent, extensible static site generator'
arch=('x86_64')
url='https://bagatto.co/'
depends=('janet')
license=('BSD3')
provides=('bagatto')

source=("https://git.sr.ht/~subsetpark/bagatto/archive/v${pkgver}.tar.gz")

sha256sums=('48323442fd77c469b21c95f96c213a06cacc5fa72d9bf315490413ee14d05a5c')

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
