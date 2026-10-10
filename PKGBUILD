# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp
pkgver=1.1.5
pkgrel=1
pkgdesc='Parallel SSH Executor'
arch=(x86_64)
url=https://github.com/bahamas10/sshp
license=(MIT)
depends=(glibc)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('63f94f9770808dafe13c7717b88570eae27c1e6355c412aa91ba17de980566f96b50841f8f893caab0d0b4ab67327fb9fd178f5a88e04bd2b830ead6f15e5adc')

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
