# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp
pkgver=1.1.4
pkgrel=1
pkgdesc='Parallel SSH Executor'
arch=(x86_64)
url=https://github.com/bahamas10/sshp
license=(MIT)
depends=(glibc)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('a762956f3582724c2bd078fb277db254b420afdeb54801b641d7043acb4b0f09ce831898deee642f23f578d22618a7fa8435baf1a247da77d99e1928218e5e34')

prepare() {
    cd $pkgname-$pkgver
    sed -i 's|$(CFLAGS) $^|$(CFLAGS) $(LDFLAGS) $^|' Makefile
}

build() {
    cd $pkgname-$pkgver
    make
}

check() {
    cd $pkgname-$pkgver
    make test
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 sshp -t "$pkgdir/usr/bin"
    install -Dm644 man/sshp.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 CHANGES.md -t "$pkgdir/usr/share/doc/sshp"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sshp"
}
