# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mdfried
pkgver=0.12.0
pkgrel=1
pkgdesc="A markdown viewer for the terminal that renders images and big headers"
arch=('x86_64')
url="https://github.com/benjajaja/mdfried"
license=('GPL-3.0-only')
depends=('gcc-libs' 'freetype2' 'expat')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3f202ddea91af1ab55641b3d03e6f6b7e71be57f57f7300404fd99c2ab75fb408299aee11a508ca18b50701819612b111a4efe5e541e703bf0c91f36e3467490')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}
