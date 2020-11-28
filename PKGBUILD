# Maintainer: Victor Roest <victor at xirion dot net>
# Co-Maintainer: Jonathan Dönszelmann <jonabent at gmail dot com>
pkgname=roll-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A rust dice rolling application using the standard dice notation"
arch=('x86_64')
url="https://github.com/finitum/roll-rs"
license=('EUPL-1.2')
conflicts=('dice-roller-git' 'roll-rs-git')
provides=('roll-rs')

makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/finitum/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e09d527c522e834110f901a5ba9bbe2bcbefdda5eb1f6e9c28bfc02a407a8026a5efd6ef885dfd75a96558eab9dc5f04bd8ab6f468c7427cada2622f93871427')

build () {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features --target-dir=target
}

check () {
    cd "$pkgname-$pkgver"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/roll" -t "${pkgdir}/usr/bin/"
}

