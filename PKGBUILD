# Maintainer: Max R. P. Grossmann <m@max.pm>
# Contributor: Christer Edwards <cedwards@xmission.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis
pkgname=ucspi-tcp
pkgver=0.88
pkgrel=8
pkgdesc="Easy-to-use command-line tools for building TCP client-server applications."
arch=('i686' 'x86_64')
url="http://cr.yp.to/ucspi-tcp.html"
license=('public-domain')
source=("http://cr.yp.to/$pkgname/$pkgname-$pkgver.tar.gz"
        "ucspi-tcp-$pkgver-ipv6.patch"
        "head-1.patch")
sha512sums=('44efbd477dacf31d39fc970e2d2f74526dc815b905742f6127f0d5c80928ecc7e743089eaab0492386a58d5b97905113fbe8bbc7214ae179b7be27966b7566c7'
            '4180f2e8e0bd23bc345d363b5cfeab321293360203386fc93672bcb5c6fd8145d82c4eedb261abd0faacbce15bcd3180d7b02f2604039db735def7cdcd30abbc'
            '815b4caa3d9a294e3fe69a464f37d1f50ebd83e25d608955dff4b78da1d3ddd9fb4f2586ab41552f006a117f2bd7a937a6ee485dd7897d2d63a9f9e2e12a1d8d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < "$srcdir/head-1.patch"
    patch -p1 < "$srcdir/ucspi-tcp-$pkgver-ipv6.patch"
    echo "gcc ${CFLAGS}" > conf-cc
    echo "gcc ${LDFLAGS}" > conf-ld
    echo "/usr" > conf-home
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    for bin in tcpserver tcprules tcprulescheck argv0 recordio \
               tcpclient *\@ tcpcat mconnect mconnect-io addcr \
               delcr fixcrio rblsmtpd; do
        install -m 755 -D $bin "$pkgdir/usr/bin/$bin"
    done
}
