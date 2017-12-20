# Maintainer: Shell Chen <aur@sorz.org>
pkgname=moproxy
pkgver=0.1.6
pkgrel=1
pkgdesc="A transparent TCP to SOCKSv5/HTTP proxy."
url="https://github.com/sorz/moproxy"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/moproxy/config.env' 'etc/moproxy/proxy.ini')
makedepends=('rust' 'cargo')
source=("https://github.com/sorz/moproxy/archive/v$pkgver.tar.gz")
sha256sums=('a896cdc87eaa04809abb48708f81449a286d4d3011ed805b00f53624c90df512')

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
