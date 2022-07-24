# Maintainer: Mike Zorn (mike-zorn) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.2.1
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mike-zorn/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mike-zorn/purple-hue/archive/$pkgver.tar.gz")
license=('GPL')
sha512sums=('f0805c6b69eb2c9112b475545807eded09acc5eb87ea867980776dd2b56cd822349d242cbcfb5d9979f2b781fd329f542db4760ba50f2dc0a82ffc00734efb74')

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
