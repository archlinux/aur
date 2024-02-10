# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=blink-emulator
pkgver=1.1.0
pkgrel=1
pkgdesc='tiniest x86-64-linux emulator'
url='https://github.com/jart/blink'
source=(
  "https://github.com/jart/blink/archive/refs/tags/$pkgver.tar.gz"
  "LICENSE")
arch=('x86_64' 'aarch64')
license=('ISC')
options=('!lto')
changelog='CHANGELOG'
b2sums=('33a092224e488a086ff380b97f8364f4e050254aa18ce63997061584d9574e652d851dcafba181e12c35fde175add403a044aab8efb18e2fe4e391921bc7b2bd'
        '5ec87efa72e92e791e7ccdb0aab16008076c05f458c4b7b11afb59c76ede2bb3e493cd7d68efe6b3412b08d1a9fa3b4489bce488b1d37ea056a22f062fe586db')

build() {
  cd "$srcdir/blink-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/blink-$pkgver"

  install -Dm755 "./o/blink/blink" "$pkgdir/usr/bin/blink"
  install -Dm755 "./o/blink/blinkenlights" "$pkgdir/usr/bin/blinkenlights"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "./blink/blink.1" "$pkgdir/usr/share/man/man1/blink.1"
  install -Dm644 "./blink/blinkenlights.1" "$pkgdir/usr/share/man/man1/blinkenlights.1"
}
