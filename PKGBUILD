# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Vaishnav-Sabari-Girish <vaishnav.sabari.girish@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=comchan
_pkgname=ComChan
pkgver=0.14.0
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor with plotter TUI and more"
arch=(
  'x86_64'
  'aarch64'
  'riscv64'
)
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')
depends=('gcc-libs' 'libudev.so' 'fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a8991a6276d62ad9c513253e6cdb27300c51bc78757a2aa141fe8975d0dfaea7')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
