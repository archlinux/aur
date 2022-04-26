# Maintainer: Jonathan Gruber <gruberjonathan at gmail dot com>
# Contributor: Yamakaky <yamakaky at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

pkgname=mbpfan-git
pkgver=2.3.0.r1.g7981306
pkgrel=1
pkgdesc="A simple daemon to control fan speed on all MacBook/MacBook Pros"
arch=('x86_64' 'i686')
url="https://github.com/dgraziotin/mbpfan"
license=('GPL3')
makedepends=('git')
provides=('mbpfan')
source=("$pkgname"::'git+https://github.com/dgraziotin/mbpfan.git')
md5sums=('SKIP')
backup=('etc/mbpfan.conf')

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
    install -Dm644 "mbpfan.8.gz" "$pkgdir/usr/share/man/man8/mbpfan.8.gz"
}
