# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=libmtdac
pkgver=1.5.1
pkgrel=1
pkgdesc='Library to interface with the HMRC Make Tax Digital API'
arch=('x86_64' 'i686')
url='https://github.com/ac000/libmtdac'
license=('LGPL-2.1-only')
depends=('libcurl-gnutls' 'jansson')
source=("https://github.com/ac000/libmtdac/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c47b5893d9bd0d4779edede8b8d12f82f78395226836d66157a33abe28d404b3')

build() {
    cd libmtdac-$pkgver
    make
}

package() {
    cd libmtdac-$pkgver

    install -Dp -m0644 -t $pkgdir/usr/include/libmtdac/ include/libmtdac/*.h
    install -Dp -m0755 src/libmtdac.so.$pkgver $pkgdir/usr/lib/libmtdac.so.$pkgver
    install -Dp -m0644 -t $pkgdir/usr/share/man/man3/ docs/man/man3/*.3
    install -Dp -m0644 -t $pkgdir/usr/share/man/man3type/ docs/man/man3type/*.3type
    cd $pkgdir/usr/lib
    ln -s libmtdac.so.1 libmtdac.so
}
