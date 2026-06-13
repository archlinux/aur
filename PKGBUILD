# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>

pkgname=wireforge-ratty
_pkgname=wireforge
pkgver=0.6.0
pkgrel=1
pkgdesc="Braille Wireframe Viewer"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/wireforge"
license=('MIT')

depends=('gcc-libs')
makedepends=(
  'cargo'
)

source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb247e7d721d53757cbd2c6f9c62593209d171481f47750835a3c2ca8cd371a5')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --features ratty --release --frozen
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm755 \
    target/release/$_pkgname \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
