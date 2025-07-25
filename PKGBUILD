# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht' is no longer available
pkgname=ht-term
pkgver=0.4.0
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
sha512sums=('bd6192874150f78909cdfa2f15f7ac97c386b3059a4f8ab560a33b4e556fd2a9ec90a96f3be9730f315d57282ac41dab0a0f46b94160b727ccdb62216a0f4cb3')

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
