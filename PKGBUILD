# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp-git
_name=${pkgname%-git}
pkgver=1.1.3.r2.g01c3f71
pkgrel=1
epoch=1
pkgdesc="Parallel SSH Executor"
arch=('x86_64')
url="https://github.com/bahamas10/$_name"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    export CFLAGS+=' -fPIE -Wl,-z,relro,-z,now'
    make
}

check() {
    cd $_name
    make -k check
}

package() {
    cd $_name
    install -Dm755 sshp "$pkgdir/usr/bin/$pkgname"
    install -Dm644 man/sshp.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
