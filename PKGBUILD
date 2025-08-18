# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=sshp
pkgver=1.1.3
pkgrel=10
pkgdesc='Parallel SSH Executor'
arch=('x86_64')
url="https://github.com/bahamas10/$pkgname"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('3a3dde753df3bd27b605dd9b72920287b3d348c5e7dcf3d334e1eaa7d48e11d15dd52d5b0445b674ac30d76b8a53564b404ed319e5a0a4ff39e0752069b2f2a3')

build() {
    cd $pkgname-$pkgver
    export CFLAGS+=' -fPIE -Wl,-z,relro,-z,now'
    make
}

check() {
    cd $pkgname-$pkgver
    make -k check
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 sshp "$pkgdir/usr/bin/$pkgname"
    install -Dm644 man/sshp.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
