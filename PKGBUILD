# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=1
pkgdesc="config manager (simple impl of gun-stow)"
arch=('x86_64')
url="https://github.com/someoneonsmile/stow"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('gnu-stow')
source=("stow-$pkgver.tar.gz::https://github.com/someoneonsmile/stow/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('23f28b617fa9a0c3ac6d44c686751ff2c2d9ee43275725249f03dbb0cfcb0b8ba50fa93369b9f645239b3e42b406c80f335372ba2246f3ac821fc9074d168007')

build() {
  cd "stow-$pkgver"
  cargo build --release
}

check() {
  cd "stow-$pkgver"
  cargo test --release
}

package() {
  cd "stow-$pkgver"
  install -Dm755 "target/release/stow" "$pkgdir/usr/bin/stow"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
