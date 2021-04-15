# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=ec
pkgver=0.5.1
pkgrel=1
pkgdesc='A desk calculator with vectors and quotations'
arch=('x86_64')
url='https://git.sr.ht/~subsetpark/ec'
depends=('janet' 'pkg-config' 'libedit')
license=('BSD3')
provides=('ec')

source=("${url}/archive/v${pkgver}.tar.gz")

sha256sums=('6efebf33462ae127d6f96ee3ba65b085ce912f0cda337d12b58be72a20519dbc')

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
