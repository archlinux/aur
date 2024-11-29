# Maintainer: Your Name <your@email.com>

pkgname=gmsync
pkgver=0.1.0
pkgrel=1
pkgdesc="A parallel rsync transfer manager with tmux integration"
arch=('x86_64')
url="https://github.com/mccarthee/gmsync"
license=('MIT')
depends=('rsync' 'tmux' 'libnotify')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mccarthee/gmsync/archive/v$pkgver.tar.gz")
sha256sums=('9cd872a03412704759a1acac9aaf51f5f85efe3573e4f03390453f9e17ad5af3')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install man page
    install -Dm644 "man/gmsync.1" "$pkgdir/usr/share/man/man1/gmsync.1"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
