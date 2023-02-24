# Maintainer: Wallun <wallun AT disroot DOT org>
# Maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=nfs4-acl-tools
pkgver=0.4.2
pkgrel=1
pkgdesc="commandline ACL utilities for the Linux NFSv4 client"
arch=('i686' 'x86_64')
url="http://linux-nfs.org"
license=('custom')

depends=('attr')
makedepends=('autoconf' 'automake')

source=("$pkgname-$pkgver.tar.gz::https://git.linux-nfs.org/?p=steved/$pkgname.git;a=snapshot;h=refs/tags/$pkgname-$pkgver;sf=tgz")
sha256sums=('327dbc968f1112a0680ca953a88d8f95a5c5697b54a8cafb405953c501d7486b')

build() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"

    cp -f /usr/share/autoconf/build-aux/{config.guess,config.sub} .
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
