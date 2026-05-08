# Maintainer: Craig McLure <craig@mclure.net>
pkgname=beacn-utility
pkgver=0.2.1
pkgrel=1
pkgdesc="A utility for controlling Beacn devices."
arch=('x86_64')
url="https://github.com/beacn-on-linux/beacn-utility"
license=('MIT')
makedepends=('rust')
install=beacn-utility.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/beacn-on-linux/beacn-utility/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e20bf656f7d41ed76bec717e41a0585081833f613028535c93bd043f20e2fd8006de652e819477a3b379785ed2cb82d8a4933e7a1b6f3ae04f63bc7e3efc5059')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/beacn-utility" "$pkgdir/usr/bin/beacn-utility"
    install -Dm644 "50-beacn.rules" "$pkgdir/etc/udev/rules.d/50-beacn.rules"

    install -Dm644 "resources/icons/beacn-utility.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/beacn-utility.png"
    install -Dm644 "resources/icons/beacn-utility.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/beacn-utility.svg"
    install -Dm644 "resources/icons/beacn-utility-large.png" "$pkgdir/usr/share/pixmaps/beacn-utility.png"
    install -Dm644 "resources/desktop/io.github.beacn_on_linux.beacn-utility.desktop" "$pkgdir/usr/share/applications/io.github.beacn_on_linux.beacn-utility.desktop"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
