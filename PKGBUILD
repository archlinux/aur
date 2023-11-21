# Maintainer: Anthony Templeton anthonyt@duck.com
pkgname=swaddle
pkgver=v0.1.2
pkgrel=1
pkgdesc="Swayidle inhibitor when watching content or listening to audio"
arch=('x86_64')
url="https://github.com/ATTron/swaddle"
license=('MIT')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/swaddle" "$pkgdir/usr/local/bin/swaddle"

    # Post-install instructions
    echo "Swaddle has been installed. To integrate it with Sway, add the following line to your Sway configuration:"
    echo "exec_always --no-startup-id /usr/local/bin/swaddle &"
    echo "Then reload your Sway configuration or restart Sway."
}
