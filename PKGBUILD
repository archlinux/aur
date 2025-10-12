# Maintainer: Cezary Switala <cezary.switala@proton.me>
pkgname=niri-switch
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast task switcher for the niri compositor"
arch=('x86_64')
url="https://github.com/Kiki-Bouba-Team/niri-switch"
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell' 'niri')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kiki-Bouba-Team/niri-switch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83e51588fc3e6251d7f58fd986dfa6e63e89cc29be54eaf50cd484f3cb50259e')

# Do not generate the debug packages
options=('!debug')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/niri-switch" "$pkgdir/usr/bin/niri-switch"
  install -Dm755 "target/release/niri-switch-daemon" "$pkgdir/usr/bin/niri-switch-daemon"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
