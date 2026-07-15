# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp-git
pkgver=1.1.4.r0.ga29aebc
pkgrel=1
epoch=1
pkgdesc='Parallel SSH Executor'
arch=(x86_64)
url=https://github.com/bahamas10/sshp
license=(MIT)
depends=(glibc)
makedepends=(git)
provides=(sshp)
conflicts=(sshp)
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd sshp
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd sshp
    sed -i 's|$(CFLAGS) $^|$(CFLAGS) $(LDFLAGS) $^|' Makefile
}

build() {
    cd sshp
    make
}

check() {
    cd sshp
    make test
}

package() {
    cd sshp
    install -Dm755 sshp -t "$pkgdir/usr/bin"
    install -Dm644 man/sshp.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 CHANGES.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
