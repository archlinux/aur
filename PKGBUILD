# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=bower-mail
pkgver=0.12
pkgrel=1
pkgdesc="A curses terminal client for the Notmuch email system"
arch=('any')
url="https://github.com/wangp/bower"
depends=('notmuch' 'ncurses' 'coreutils' 'file' 'mercury>=14.04')
makedepends=('gpgme' 'pandoc')
optdepends=('msmtp: send messages' 'lynx: dump HTML emails' 'w3m: dump HTML emails')
conflicts=('bower')
license=('GPL3')
source=("https://github.com/wangp/bower/archive/$pkgver.tar.gz")
md5sums=('c962611050f89f069a396ac83d01a9f2')

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
