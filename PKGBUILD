pkgname=traur
pkgver=0.2.0
pkgrel=1
pkgdesc='Pre-install trust scoring for AUR packages'
arch=('x86_64')
url='https://github.com/Sohimaster/traur'
license=('MIT')
depends=('git' 'pacman')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1fcf80477adaf204ebd4975f1fd5ec500fd8026840f0eebddb526211e9b6d61')
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
