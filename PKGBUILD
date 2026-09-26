# Maintainer: fr0stb1rd

_pkgname="nmail"
pkgname="$_pkgname-bin"
pkgver="5.16.4"
pkgrel=1
pkgdesc="Terminal-based email client for Linux and macOS with IMAP and SMTP support (prebuilt)"
url="https://github.com/d99kris/nmail"
license=('MIT')
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=(
  'file'
  'python'
)

optdepends=(
  'w3m: HTML email rendering and viewing'
  'pandoc: HTML to text and Markdown to HTML conversion'
  'lynx: fallback HTML viewer'
  'elinks: fallback HTML viewer'
)

source_x86_64=("https://github.com/d99kris/nmail/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-glibc.tar.gz")
source_aarch64=("https://github.com/d99kris/nmail/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64-glibc.tar.gz")

sha256sums_x86_64=('11553cd105c140ec91b18247ddbfb90b23d35a1a84a4cb32b8d7e72715931361')
sha256sums_aarch64=('1512b2c670bc7b9ad481ecf8e5eba86bfcd55cb49d0ee0459dd3dc0b6bad80b7')

package() {
  local _dir="$_pkgname-$pkgver-linux-${CARCH/aarch64/arm64}-glibc"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "$srcdir/$_dir/bin/nmail" "$pkgdir/usr/bin/"
  install -m644 "$srcdir/$_dir/share/man/man1/nmail.1" "$pkgdir/usr/share/man/man1/"
  install -m644 "$srcdir/$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$_dir/THIRD_PARTY_LICENSES" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$srcdir/$_dir/share/doc/nmail/"* "$pkgdir/usr/share/doc/$pkgname/"
}
