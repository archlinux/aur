# Maintainer: xendr4x
pkgname=metadump
pkgver=release.3.gfaef408
pkgrel=1
pkgdesc="Metadata analysis tool"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "cargo" "pkgconf" "zstd" "git")
depends=("zstd" "xz" "bzip2")
conflicts=("metadump-bin")
source=("git+https://github.com/mansar1337/metadump.git")
sha256sums=('362f61d0f4ca8802ac4ce7b9e4b5651f45c87f82b063c6bd35763aecd7e99183')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --long --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/metadump" "$pkgdir/usr/bin/metadump"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
