# Maintainer: PBS <pbs3141 at gmail dot com>
pkgname=bootmap
pkgver=0.9.1
pkgrel=1
pkgdesc="Integrated EFI image generator and system snapshotter"
arch=('x86_64')
url="https://gitlab.com/pbs3141/$pkgname"
license=('GPL3')
depends=('gcc-libs' 'util-linux-libs' 'libpipeline' 'libinih' 'btrfs-progs' 'bash' 'perl' 'sbsigntools' 'systemd')
makedepends=('asciidoc')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c5dac92078772cbd2d55b33c9a01e0b1cb233de08b867dddcbd71a538ee80da9')
backup=('etc/bootmap.conf' 'etc/kernel/cmdline')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" src/bootmap
    install -Dm644 -t "$pkgdir/etc" conf/bootmap.conf
    install -Dm644 -t "$pkgdir/etc/kernel" conf/cmdline
    install -Dm755 -t "$pkgdir/usr/lib/bootmap" scripts/*
    install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" hooks/*
    install -Dm644 -t "$pkgdir/usr/share/man/man8" doc/bootmap.8
    install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions" bash-completion/bootmap
}
