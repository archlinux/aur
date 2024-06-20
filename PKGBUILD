# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht' is no longer available
pkgname=ht-term
pkgver=0.2.0
pkgrel=1
pkgdesc='headless terminal: wrap any binary with a terminal interface'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/andyk/ht'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=(ht)
conflicts=(ht)
makedepends=('cargo')
source=("ht-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bbb15cb939854d6bb3479af2b7ec6cd36ee96e4f82a1d0625bf5ed052d56797d5a281a97cef45b734feac7a689898755329ce68259873deb905e030fcc9ff02f')

build() {
  cd ht-$pkgver
  cargo build --release --locked
}

check() {
  cd ht-$pkgver
  cargo test --release --locked
}

package() {
  cd "$srcdir/ht-$pkgver"

  install -Dm755 "target/release/ht" \
    -t "$pkgdir/usr/bin/"

  install -Dm644 README.md \
    -t "$pkgdir/usr/share/doc/ht/"
}
