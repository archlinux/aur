# Maintainer: Mike Zorn (apechimp) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.1.2
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/apechimp/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/apechimp/purple-hue/archive/$pkgver.tar.gz")
license=('GPL')
sha512sums=('ecdb7bdf5440e8fdd656d3bf687ce6ed380de585237f958570d79bebca22711a3c5697d2388c419638dc0edfb099c7ee9c656968839b7ec0e7621274055b18ff')

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
