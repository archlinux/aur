# Maintainer: fr0stb1rd

_pkgname="nchat"
pkgname="$_pkgname-bin"
pkgver="5.18.20"
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

sha256sums_x86_64=('585471728ee5fbc3ecb08ca27eea6b1167b44611f73e2401e49fcfc5bd366f7a')
sha256sums_aarch64=('155ca0e43110df1e8c9516e5851f554423a9b55c7c0769d376e88fa609fef6d5')

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
