# Maintainer: phire <me@phire.cc>
pkgname=mlvd
pkgver=0.4.1
pkgrel=1
pkgdesc="A minimal Mullvad WireGuard client"
arch=('any')
url="https://github.com/phirecc/mlvd"
depends=('wireguard-tools' 'openresolv')
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('764a4de0b76c0f9028eb75e2965a1eb6')
backup=(var/lib/mlvd/template.conf)

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/mlvd" "$pkgdir/usr/bin/mlvd"
    install -Dm600 "template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
