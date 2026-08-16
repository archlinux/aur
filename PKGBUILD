# Maintainer: Julian Corbet <julian.corbet@gmail.com>
pkgname=nixlock
pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland session locker that keeps kiosk outputs live while locking the rest, with PAM unlock"
arch=('x86_64')
url="https://github.com/julian-corbet/nixlock-corbet-ch"
license=('MIT')
depends=('pam' 'wayland' 'libxkbcommon')
makedepends=('cargo')
provides=('nixlock')
conflicts=('nixlock-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julian-corbet/nixlock-corbet-ch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dee63529b8ebdc74a726b3c45b841b67e390c646ee9fc215828820543ae7f4a2')

build() {
    cd "nixlock-corbet-ch-$pkgver"
    cargo build --release --frozen --bin nixlock
}

package() {
    cd "nixlock-corbet-ch-$pkgver"
    install -Dm755 "target/release/nixlock" "$pkgdir/usr/bin/nixlock"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
