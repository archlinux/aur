# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=nfs4-acl-tools
pkgver=0.3.7
pkgrel=1
pkgdesc="commandline ACL utilities for the Linux NFSv4 client"
arch=('i686' 'x86_64')
url="http://linux-nfs.org"
license=('custom')

depends=('attr')
makedepends=('autoconf' 'automake')

source=("$pkgname-$pkgver.tar.gz::https://git.linux-nfs.org/?p=bfields/$pkgname.git;a=snapshot;h=refs/tags/$pkgname-$pkgver;sf=tgz")
sha256sums=('aab3eb6a60f319c95d7e1abe6ddbd81fdd4a7ec03161d3c59209c82e09e4fd60')

prepare() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"

    cp -f /usr/share/autoconf/build-aux//config.guess /usr/share/autoconf/build-aux//config.sub .
}

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"

    autoreconf -vfi

    ./configure \
        --prefix=/usr \
        CFLAGS="$CFLAGS" \
        LDFLAGS="$LDFLAGS"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
