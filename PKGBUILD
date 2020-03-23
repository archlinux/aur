# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e
pkgver=0.3.1
pkgrel=3
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
depends=('gcc-libs')
makedepends=('rust' 'nasm' 'cargo-c')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xiph/rav1e/archive/v$pkgver.tar.gz"
        "https://github.com/xiph/rav1e/releases/download/v$pkgver/Cargo.lock")
sha256sums=('581b50e1e550835b65dd20f3c851cf2dae93eac0ee016caadfaa5faef8eee6f0'
            '5d7d408bdcf69059f07fe060c64d14a1ef2fac42a59350c3dfb3a85a8e94881a')


prepare() {
  cd "$pkgname-$pkgver"

  cp "$srcdir/Cargo.lock" ./
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --release \
  #  --locked
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver"
  # for librav1e
  cargo cinstall \
    --release \
    --locked \
    --destdir "$pkgdir" \
    --prefix "/usr"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rav1e"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"
}
