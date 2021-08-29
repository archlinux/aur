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
sha512sums=('1c154c9b3bb9f361f0311b462f41a03c52f547b3dba43e69f65b8ac1e40d79217d599c441608b373d81162e1013c529320098112b92531dd875797dadbf86f92 ')

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
