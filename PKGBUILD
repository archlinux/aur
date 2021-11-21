# Maintainer: Mike Zorn (apechimp) <apechimp@icloud.com>

pkgname=purple-hue
pkgver=0.1.4
pkgrel=0
pkgdesc="Change a hue light's color based on air quality data from purple air."
provides=('purple-hue')
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mike-zorn/purple-hue"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mike-zorn/purple-hue/archive/tags/v$pkgver.tar.gz")
license=('GPL')
sha512sums=('5b073aa7d646b94e97bb62c72990ea48920b5b377abac09d45595cb929aefcecb427cdb1b54b8f0dde0db120910b335b804d430c27001b5bfc45a3bdb1288e1b')

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
