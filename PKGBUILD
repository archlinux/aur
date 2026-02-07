pkgname=traur
pkgver=0.1.5
pkgrel=1
pkgdesc='Heuristic security scanner for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dcc00877bc4bcc0a0d052dd431a9fa7f6958bd00274fec37b8b47b71258e44cd')
backup=('etc/traur/config.toml')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --locked --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/traur "$pkgdir/usr/bin/traur"
    install -Dm755 target/release/traur-hook "$pkgdir/usr/bin/traur-hook"
    install -Dm644 hook/traur.hook "$pkgdir/usr/share/libalpm/hooks/traur.hook"
    install -Dm644 data/patterns.toml "$pkgdir/usr/share/traur/patterns.toml"
}
