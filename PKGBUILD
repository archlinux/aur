# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=libmtdac
pkgver=1.5.3
pkgrel=1
pkgdesc='Library to interface with the HMRC Make Tax Digital API'
arch=('x86_64' 'i686')
url='https://github.com/ac000/libmtdac'
license=('LGPL-2.1-only')
depends=('libcurl-gnutls' 'jansson')
source=("https://github.com/ac000/libmtdac/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc567c20f1edaa26e92e57a433dbbbdbcafdef3b6751b52ea9cda1fb32fab7e1')

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
