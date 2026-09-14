# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=clck
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland session locker with live kiosk outputs"
arch=('x86_64')
url="https://github.com/corbet-labs/clck"
license=('LicenseRef-FSL-1.1-ALv2')
depends=('pam' 'wayland' 'libxkbcommon')
makedepends=('cargo' 'git')
provides=('clck')
conflicts=('clck-bin')
source=("$pkgname::git+https://github.com/corbet-labs/clck.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --frozen --bin clck
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/clck" "$pkgdir/usr/bin/clck"
    ln -s clck "$pkgdir/usr/bin/nixlock"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
