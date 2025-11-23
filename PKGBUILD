# Maintainer: Namilsk <namilsk@namilsk.tech>
pkgname=weatherfetch
pkgver=0.0.4
pkgrel=1
pkgdesc="A rust fetch tool like neofetch or fastfetch but with Weather. Cli: wfetch"
arch=('x86_64')
url="https://github.com/Nam4ik/WeatherFetch"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nam4ik/WeatherFetch/archive/v$pkgver.tar.gz")
sha256sums=('8043b8644b55bf411965c0ba5030e06572a701f33a4d51804a37a7b534dc08c1')

build() {
    cd "$srcdir/WeatherFetch-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/WeatherFetch-$pkgver"
    install -Dm755 "target/release/wfetch" "$pkgdir/usr/bin/wfetch"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    install -Dm644 src/arts.yaml "$pkgdir/home/$USER/.config/$pkgname/arts.yaml"
}
