# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lifecycler
pkgver=0.2.3
pkgrel=1
pkgdesc="Terminal aquarium"
arch=('x86_64')
url="https://github.com/cxreiff/lifecycler"
license=('MIT' 'Apache-2.0' 'CC0-1.0')
depends=('gcc-libs' 'alsa-lib' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('04ad147f8456537f6938cd12a15e239546a7837868cff8125d2db8af435b7ec823646075a33f60218feff3747fb9aa9f4e391fcdae302c122c0563b4c77dc85d')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
