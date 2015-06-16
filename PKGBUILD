# Maintainer: Yamakaky <yamakaky at_gmail_dot com>
# Contributor: Allan McRae <allan at_archlinux_dot org>

pkgname=mbpfan-git
pkgver=1.9.1
pkgrel=1
pkgdesc="Automatically adjust the fan on a MacBook Pro"
arch=('x86_64')
url="https://github.com/dgraziotin/Fan-Control-Daemon"
license=('GPL3')
makedepends=('git')
provides=('mbpfan')
source=("$pkgname"::'git://github.com/dgraziotin/mbpfan.git'
        'mbpfan.install')
md5sums=('SKIP'
         '750a90c1ff128d9b7eafcdd765d3595b')
install='mbpfan.install'

pkgver(){
    cd "$srcdir/$pkgname"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "bin/mbpfan" "$pkgdir/usr/bin/mbpfan"
    install -Dm644 "mbpfan.conf" "$pkgdir/etc/mbpfan.conf"
    install -Dm644 "mbpfan.service" "$pkgdir/usr/lib/systemd/system/mbpfan.service"
}
