# Maintainer: Mike Zorn (apechimp) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.1.3
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mike-zorn/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mike-zorn/purple-hue/archive/tags/v$pkgver.tar.gz")
license=('GPL')
sha512sums=('2c5e40c9e85f92e8362e04fd13f43d9325ea909c62c130c52d7341d9b54875a4f29e5de85112b5e54df86c9e93026d8226112c8db9cd7162fb9ef7c0d61fc328')

build() {
    tar xvzf "$pkgname-$pkgver.tar.gz"
    mv "purple-hue-tags-v$pkgver"/* .
    cargo build --release --locked
}

check() {
    cargo test --release --locked
}

package() {
    install -Dm755 target/release/purple-hue "$pkgdir/usr/bin/purple-hue"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "systemd/purple-hue.timer" "$pkgdir/usr/lib/systemd/system/purple-hue.timer"
    install -Dm644 "systemd/purple-hue.service" "$pkgdir/usr/lib/systemd/system/purple-hue.service"
}
