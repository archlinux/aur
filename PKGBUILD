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
sha512sums=('7986f0a877318866d7995583151457386ab4fc907b97cfe5fb3ead80b5eb8b05a052d14970535f3a338515c92fd808958acf4819324efaf3f77cfe12bf89bc51')

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
