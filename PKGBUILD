# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.6.3
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('7d7e7aa33867fd4f1b5d1003ce647f6e0875db4d9d115f4d0228f3a7d744d5a58d8bc61415a0cec65961d8df04927e3d130ca73b9048722f52932b8aa8998374')

prepare() {
  cd broot-$pkgver
  sed -i '34s/0.6.1/0.6.2/' Cargo.lock
}

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
