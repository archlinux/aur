# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=clck
pkgver=0.1.0
pkgrel=2
pkgdesc="Wayland session locker with live kiosk outputs"
arch=('x86_64')
url="https://github.com/corbet-labs/clck"
license=('LicenseRef-FSL-1.1-ALv2')
depends=('pam' 'wayland' 'libxkbcommon')
makedepends=('cargo')
provides=('clck')
conflicts=('clck' 'nixlock' 'nixlock-bin' 'clck-bin')
replaces=('nixlock-bin' 'nixlock')
# NOTE: registry package is clck-kiosk (crates.io clck is taken); binary stays clck.
# crates.io, not GitHub: github.com serves every corbet-labs URL with 404s
# (org-wide flag, 2026-09-14). Revisit a git source once anonymous serving works again.
source=("https://static.crates.io/crates/clck-kiosk/clck-kiosk-$pkgver.crate")
sha256sums=('ec3dbaac924663e8aaa24aed92236347c500cfb3046fdcc7994ad1efa3b3b939')

build() {
    cd "clck-kiosk-$pkgver"
    cargo build --release --frozen --bin clck
}

package() {
    cd "clck-kiosk-$pkgver"
    install -Dm755 "target/release/clck" "$pkgdir/usr/bin/clck"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
