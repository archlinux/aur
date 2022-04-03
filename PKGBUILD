# Maintainer: leaty <dev@leaty.net>
pkgname=tuxtrain
pkgver=0.0.4
pkgrel=1
pkgdesc='An easy-to-use generic trainer for Linux'
url='https://github.com/leaty/tuxtrain'
source=("$pkgname-$pkgver.tar.gz::https://github.com/leaty/tuxtrain/archive/v$pkgver.tar.gz")
backup=(etc/tuxtrain/eldenring.toml)
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
sha256sums=('4bb9444982ecd30d971c39b82fc04474a60539c7273341d2422dc7bca0b5a14b')

build () {
    cd $pkgname-$pkgver

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 target/release/tuxtrain "$pkgdir/usr/bin/tuxtrain"
    install -Dm755 target/release/tuxtraind "$pkgdir/usr/bin/tuxtraind"
    install -Dm644 tuxtraind.service "$pkgdir/usr/lib/systemd/system/tuxtraind.service"
    install -Dm644 trainers/eldenring.toml "$pkgdir/etc/tuxtrain/eldenring.toml"
    install -Dm644 trainers/example.toml "$pkgdir/usr/share/tuxtrain/example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 example.png "$pkgdir/usr/share/doc/$pkgname/example.png"
}
