# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht' is no longer available
pkgname=ht-term
pkgver=0.3.0
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
sha512sums=('f6e84d13de17834c673c75554b4737711483881388696b3f689ae9500ed0d3080b18ad4eb204f40c045f4a6bb09f945e9a127ce42d6d767f29c0ce94ea056e93')

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
