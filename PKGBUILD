# Maintainer: Taxin <taxin404@duck.com>
pkgname=bongo
pkgver=1.1.0
pkgrel=1
pkgdesc="Bangla input method (Avro Phonetic and National/Bijoy) with fcitx5 and IBus frontends"
arch=('x86_64' 'aarch64')
url="https://github.com/mehedishakeel/Bongo"
license=('MPL-2.0')
depends=('fcitx5' 'gtk4' 'python-gobject' 'python')
makedepends=('cargo' 'cmake' 'ninja' 'pkgconf')
optdepends=('ibus: IBus frontend for GNOME'
            'fcitx5-configtool: add Bongo to the fcitx5 input method list')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4acf717898cadd2bb2e05e39e799ff9eb2e3d3830d5e3a57e4f450662aed6f7f')

build() {
  cd "Bongo-$pkgver/platforms/linux/engine"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

package() {
  cd "Bongo-$pkgver"
  DESTDIR="$pkgdir" PREFIX=/usr BONGO_FCITX5=1 \
    bash platforms/linux/scripts/install.sh
  install -Dm644 LICENSE THIRD_PARTY_NOTICES.md licenses/MPL-2.0.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
