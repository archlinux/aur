# Maintainer: ber532k <ber532k@gmx.de>
pkgname=bower-mail
pkgver=0.9
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=('any')
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file' 'mercury>=11.07')
makedepends=('gpgme' 'pandoc')
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower')
license=('GPL3')
source=("https://github.com/wangp/bower/archive/$pkgver.tar.gz")
md5sums=('72ee912f56b529cc7e098b1e13a40d63')

build() {
    patch "$srcdir/bower-$pkgver/src/Mercury.options" < ../arch.patch
    cd "$srcdir/bower-$pkgver"
    make PARALLEL=$MAKEFLAGS
    make man
    gzip -f bower.1
}

package() {
    install -Dm 755 "$srcdir/bower-$pkgver/bower" "$pkgdir/usr/bin/bower"
    install -Dm 644 "$srcdir/bower-$pkgver/bower.1.gz" \
        "$pkgdir/usr/share/man/man1/bower.1.gz"
}
