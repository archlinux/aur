# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli
_pkgname=globe
pkgver=0.2.0
pkgrel=2
pkgdesc="ASCII globe generator"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
conflicts=("$_pkgname")
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1d2c1f9c480b16971fa093d81254cf61cadda44c2ee94ba7c4e48b20994f0340839443473614be751bd4ce23b84fa7652df9a1437ae61e552278795481c3ba14')

build() {
  cd "$_pkgname-$pkgver"
  # TODO: Use `--locked` flag for reproducibility (for the new release).
  # Tracking issue: https://github.com/adamsky/globe/pull/21#issuecomment-729935054
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
