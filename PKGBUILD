# Maintainer: Syed Insaf <syedinsaf@proton.me>
# GitHub: https://github.com/syedinsaf/otaripper

pkgname=otaripper
pkgver=2.1.1
pkgrel=1
pkgdesc="Ultra-fast partition extractor for Android OTA .zip and payload.bin files"
arch=('x86_64' 'aarch64')
url="https://github.com/syedinsaf/otaripper"
license=('Apache-2.0')

depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'pkgconf')

provides=('otaripper')
conflicts=('otaripper-bin')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2aa99f8129f005a99466a799752ad658e13ea2a474c937c47141669698a17d49')

build() {
  cd "$pkgname-$pkgver"

  export CARGO_TARGET_DIR=target
  unset LDFLAGS CFLAGS CPPFLAGS

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  target/release/otaripper --help > /dev/null
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/otaripper \
    "$pkgdir/usr/bin/otaripper"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
