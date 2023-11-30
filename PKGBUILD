# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=gnix
pkgver=1.0.0
pkgrel=1
pkgdesc="a simple stupid http reverse proxy"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/gnix"
license=('AGPL3')
makedepends=('rustup')
backup=('etc/gnix.yaml')
source=("https://codeberg.org/metamuffin/gnix/archive/v$pkgver.tar.gz"
        "gnix.service"
        "config.yaml"
        "sysusers.conf")
sha256sums=("bb58331b29ff2f6c806ed0b666aaa184e7b6a9d656671a2c5e0adcb283265a91"
            "SKIP"
            "SKIP"
            "SKIP")

build() {
    cd "gnix"
    cargo +nightly build --release --bin $pkgname
    strip -s target/release/$pkgname
}
package() {
    install -Dm755 gnix/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/gnix.conf"
    install -Dm644 gnix.service "$pkgdir/usr/lib/systemd/system/gnix.service"
    install -Dm644 config.yaml "$pkgdir/etc/gnix.yaml"
}
