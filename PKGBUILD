# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp-git
pkgver=1.1.3.r3.gb7db440
pkgrel=1
epoch=1
pkgdesc="Parallel SSH Executor"
arch=('x86_64')
url='https://github.com/bahamas10/sshp'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('sshp')
conflicts=('sshp')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd sshp
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd sshp
    export CFLAGS+=' -fPIE -Wl,-z,relro,-z,now'
    make
}

check() {
    cd sshp
    make -k check
}

package() {
    cd sshp
    install -Dm755 sshp -t "$pkgdir/usr/bin"
    install -Dm644 man/sshp.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/sshp"
    install -Dm644 CHANGES.md -t "$pkgdir/usr/share/doc/sshp"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
