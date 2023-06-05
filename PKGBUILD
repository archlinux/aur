# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=blink-emulator
pkgver=1.0.0
pkgrel=1
pkgdesc='tiniest x86-64-linux emulator'
url='https://github.com/jart/blink'
source=(
  "https://github.com/jart/blink/archive/refs/tags/$pkgver.tar.gz"
  "unused_result.patch"
  "LICENSE")
arch=('x86_64' 'aarch64')
license=('ISC')
b2sums=('6600ddcfd98312f1bae91da388d3e030b1907780ec5b0ec7c8e81779756a3f28590878a744762907a2080db9cf9eb9b201c319dc680f3f1b22b59f1b509590f3'
        'fd48c46813be51442190468e1b89ea1635abd092f9ab342c5ef27c06e8e334f3c7e56bf40338c0642180b9e0bbccd4b3eeaa313c83e75b08c56b68c1ff70e577'
        '5ec87efa72e92e791e7ccdb0aab16008076c05f458c4b7b11afb59c76ede2bb3e493cd7d68efe6b3412b08d1a9fa3b4489bce488b1d37ea056a22f062fe586db')

prepare() {
  cd "$srcdir/blink-$pkgver"

  patch --forward --strip=1 --input="$srcdir/unused_result.patch"
}

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
}
