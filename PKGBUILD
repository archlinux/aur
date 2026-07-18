# Maintainer: fr0stb1rd

_pkgname="nchat"
pkgname="$_pkgname-bin"
pkgver="5.17.26"
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

sha256sums_x86_64=('f70c9cd5eb90850ff5fe46b3a7391790b4792706a4df14dab269446658ee5005')
sha256sums_aarch64=('a2822c3e3e8f33c7c71bc1eb803b5184ae0257c632721a52fe8f70d068230ea5')

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
