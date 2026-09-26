# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

_pkgname="nchat"
pkgname="$_pkgname-bin"
pkgver="5.19.18"
pkgrel=1
pkgdesc=" Terminal-based messaging client for Linux and macOS with Telegram, WhatsApp and Signal support (prebuilt)"
url="https://github.com/d99kris/nchat"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=(
  'file'
  'python'
)

source_x86_64=("https://github.com/d99kris/nchat/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-glibc.tar.gz")
source_aarch64=("https://github.com/d99kris/nchat/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64-glibc.tar.gz")

sha256sums_x86_64=('2337bf27dc2949ca0e7cbb237379a7eba1926c96485706e9960eb5f76fda3747')
sha256sums_aarch64=('b652373bcf9e4d6e9b75be2d77a55569473c3be6cf25ea7fa9ad713fb8a5393d')

package() {
  local _dir="$_pkgname-$pkgver-linux-${CARCH/aarch64/arm64}-glibc"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "$srcdir/$_dir/bin/nchat" "$pkgdir/usr/bin/"
  install -m644 "$srcdir/$_dir/share/man/man1/nchat.1" "$pkgdir/usr/share/man/man1/"
  install -m644 "$srcdir/$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$_dir/THIRD_PARTY_LICENSES" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$_dir/share/doc/nchat/"* "$pkgdir/usr/share/doc/$pkgname/"
}
