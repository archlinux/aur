# Maintainer: Vinay <vinayydv343@gmail.com>
pkgname=ghostty-rpc-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Discord Rich Presence integration for Ghostty terminal (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vinayydv3695/ghostty-rpc"
license=('MIT')
depends=('gcc-libs')
provides=('ghostty-rpc')
conflicts=('ghostty-rpc')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/ghostty-rpc-v$pkgver-x86_64.tar.gz"
               "service::$url/raw/v$pkgver/assets/ghostty-rpc.service"
               "config.example::$url/raw/v$pkgver/assets/config.toml.example")
sha256sums_x86_64=('1cfd66c8e90950577ef00ce42972882cfc29afe5a97564fe4f28c0cad6f9555b'
                   'SKIP'
                   'SKIP')

package() {
    # Install pre-compiled binary
    install -Dm755 "ghostty-rpc" "$pkgdir/usr/bin/ghostty-rpc"
    
    # Install systemd user service
    install -Dm644 "service" "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    
    # Install systemd user preset to automatically enable service for desktop login
    install -d "$pkgdir/usr/lib/systemd/user-preset"
    echo "enable ghostty-rpc.service" > "$pkgdir/usr/lib/systemd/user-preset/50-ghostty-rpc.preset"

    # Install example config
    install -Dm644 "config.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
