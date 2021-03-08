# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=ec
pkgver=0.4.3
pkgrel=1
pkgdesc='A desk calculator with vectors and quotations'
arch=('x86_64')
url='https://git.sr.ht/~subsetpark/ec'
depends=('janet' 'pkg-config' 'libedit')
license=('BSD3')
provides=('ec')

source=("${url}/archive/v${pkgver}.tar.gz")

sha256sums=('f6e16200d34d304ddf6c412e06ae40edd062ae05c589959853e1a6f4797cf6fa')

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
