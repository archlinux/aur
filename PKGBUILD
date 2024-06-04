# Maintainer: tarball <bootctl@gmail.com>

# Thanks to an old but deleted package, 'ht' is no longer available
pkgname=ht-term
pkgver=0.1.1
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
sha512sums=('a9aff464a57f8e1fde58403c813213c9af6acccbfb452fecbc9319d1ad9ce50f1cae6d9118eab7aeb5efc0d6983582bc851ed99fef020886db3f0ad77ca93325')

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
