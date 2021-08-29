# Maintainer: Mike Zorn (apechimp) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.1.3
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/apechimp/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/apechimp/purple-hue/archive/$pkgver.tar.gz")
license=('GPL')
sha512sums=('b0d5026b4562458b83b138600fd4d9da7749a70b1dd814cdcc5ee1228a02fddeee43b51b76cc88107a8210bf49bf78249aba3fe34cf3d198c9a4c13789e72405')

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
