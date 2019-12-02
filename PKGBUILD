# Maintainer: Jonathan Gruber <gruberjonathan at gmail dot com>
# Contributor: Yamakaky <yamakaky at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

pkgname=mbpfan-git
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple daemon to control fan speed on all MacBook/MacBook Pros"
arch=('x86_64' 'i686')
url="https://github.com/dgraziotin/mbpfan"
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
