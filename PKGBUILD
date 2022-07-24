# Maintainer: Mike Zorn (mike-zorn) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.2.0
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mike-zorn/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mike-zorn/purple-hue/archive/$pkgver.tar.gz")
license=('GPL')
sha512sums=('93743530edd1c07c1c58adeff800b70975be6ea25641fc2d7ad27842b53e6c238d4d028dc0e6c88a5474e2fe6d786969a9b8dd548641ad3008bfc71932cbc50d')

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
