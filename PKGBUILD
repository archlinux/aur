# Maintainer: Shell Chen <aur@sorz.org>
pkgname=moproxy
pkgver=0.2.2
pkgrel=1
pkgdesc="A transparent TCP to SOCKSv5/HTTP proxy."
url="https://github.com/sorz/moproxy"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/moproxy/config.env' 'etc/moproxy/proxy.ini')
makedepends=('rust' 'cargo')
source=("https://github.com/sorz/moproxy/archive/v$pkgver.tar.gz")
sha256sums=('fe5909ebff7771eb34723e1d54215b7095eba9b93a1534e66a9db2dff9692d8c')

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
