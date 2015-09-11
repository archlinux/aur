pkgname=sshttp-git
pkgver=e145de8
pkgrel=2
pkgdesc="SSH/HTTP(S) multiplexer"
arch=('any')
url="https://github.com/stealth/sshttp"
license=('BSD')
depends=('libcap')
provides=('sshttp')
conflicts=('sshttp')
backup=('etc/conf.d/sshttpd')
makedepends=('git'
             'gcc')
source=('git://github.com/stealth/sshttp'
        'nf-cleanup'
        'sshttpd.config'
        'sshttpd.service')
md5sums=('SKIP'
         '7c75787f5b74ad1922fdf6722b1c7405'
         '6d35b4409cac3ebd6e75f4736805f102'
         'cff8825c1428b87836218af0ed8a0066')

pkgver() {
    cd $srcdir/${pkgname%-git}
    git rev-parse --short HEAD
}

build() {
    cd $srcdir/${pkgname%-git}
    make
}

package() {
    install -Dm755 sshttpd.config  $pkgdir/etc/conf.d/sshttpd
    install -Dm644 sshttpd.service $pkgdir/usr/lib/systemd/system/sshttpd.service
    install -dm755                 $pkgdir/var/sshttp
    install -Dm755 nf-cleanup      $pkgdir/usr/bin/nf-cleanup

    cd "$srcdir/${pkgname%-git}"
    install -Dm755 sshttpd        $pkgdir/usr/bin/sshttpd
    install -Dm755 nf-setup       $pkgdir/usr/bin/nf-setup
}

# vim:set ts=4 sw=4 et:
