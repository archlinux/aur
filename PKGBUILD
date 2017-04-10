# Maintainer: desbma
pkgname=debmirror
pkgver=2.26
pkgrel=1
pkgdesc="Debian partial mirror script, with ftp and package pool support"
url="https://anonscm.debian.org/cgit/collab-maint/${pkgname}.git/"
arch=('any')
license=('GPL')
depends=('bzip2' 'perl-compress-zlib' 'perl-digest-sha1' 'perl-lockfile-simple' 'perl-libwww' 'rsync' 'perl-net-inet6glue' 'gnupg')
source=("https://mirrors.kernel.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('6b5582817171936dd8118db518081b9102d2e8a0bdc83355dce4eeff84bf8592c24b9080846d04b89c25d95214d5358b4510dc282da6c6f4c48a41243d6583cb')

build() {
    cd "$srcdir/$pkgname"
    make all
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    install -Dpm644 examples/debmirror.conf $pkgdir/usr/share/doc/debmirror/examples/debmirror.conf
    install -Dpm755 debmirror   $pkgdir/usr/bin/debmirror
    install -Dpm755 mirror-size $pkgdir/usr/lib/debmirror/mirror-size
    install -Dpm644 debmirror.1 $pkgdir/usr/share/man/man1/debmirror.1
    install -Dpm644 doc/design.txt $pkgdir/usr/share/doc/debmirror/design.txt
    install -Dpm644 TODO $pkgdir/usr/share/doc/$pkgname/TODO
}
