pkgname=traur
pkgver=0.1.3
pkgrel=1
pkgdesc='Heuristic security scanner for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0948476e3aa5fb0b06131c77e9c739354fe72f08d9b5c709836ed2de885bfdb4')
backup=('etc/traur/config.toml')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/traur "$pkgdir/usr/bin/traur"
    install -Dm755 target/release/traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 hook/traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
