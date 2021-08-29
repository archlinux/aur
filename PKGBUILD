# Maintainer: Mike Zorn (apechimp) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.1.3
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/apechimp/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mike-zorn/purple-hue/archive/v$pkgver.tar.gz")
license=('GPL')
sha512sums=('d46d5ffd5dd94652fcb1da21e36ae3c88b3601f4a4943ba99fef4e75721f82f171222716d6b65c4f8724d305fa65b4664a51cfc07dfc2c0fbabbce480e3ca0d1')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/purple-hue "$pkgdir/usr/bin/purple-hue"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/purple-hue.timer" "$pkgdir/usr/lib/systemd/system/purple-hue.timer"
    install -Dm644 "systemd/purple-hue.service" "$pkgdir/usr/lib/systemd/system/purple-hue.service"
}
