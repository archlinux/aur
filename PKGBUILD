# Maintainer: Shell Chen <aur@sorz.org>
pkgname=moproxy
pkgver=0.3.0
pkgrel=1
pkgdesc="A transparent TCP to SOCKSv5/HTTP proxy."
url="https://github.com/sorz/moproxy"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/moproxy/config.env' 'etc/moproxy/proxy.ini')
makedepends=('rust' 'cargo')
source=("https://github.com/sorz/moproxy/archive/v$pkgver.tar.gz")
sha256sums=('33c79e7f9522c6d8aa94441854624b8a6ef2a06a2e1d478fef028e6a1aa9fd33')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/moproxy" "$pkgdir/usr/bin/moproxy"
    install -Dm644 "$srcdir/$pkgname-$pkgver/conf/moproxy.service" "$pkgdir/usr/lib/systemd/system/moproxy.service"
    install -Dm644 "$srcdir/$pkgname-$pkgver/conf/config.env" "$pkgdir/etc/moproxy/config.env"
    install -Dm644 "$srcdir/$pkgname-$pkgver/conf/proxy.ini" "$pkgdir/etc/moproxy/proxy.ini"
}
