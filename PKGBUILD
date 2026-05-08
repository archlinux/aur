# Maintainer: Craig McLure <craig@mclure.net>
pkgname=beacn-utility
pkgver=0.2.2
pkgrel=1
pkgdesc="A utility for controlling Beacn devices."
arch=('x86_64')
url="https://github.com/beacn-on-linux/beacn-utility"
license=('MIT')
makedepends=('rust')
install=beacn-utility.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/beacn-on-linux/beacn-utility/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7b3c2be3eb641447bc0cd9930ba7e9d4e0f77524c1a0872dc533a378467a1a5332bdafc9e4d8650624baaa45dc534af93f0c8370ac4d0cb7fc713846217ddb37')

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
