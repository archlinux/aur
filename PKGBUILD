# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat
pkgver=0.6.0
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat"
arch=('x86_64' 'aarch64')
url="https://ascii-chat.com"
license=('MIT')
depends=('zstd' 'libsodium' 'opus' 'mimalloc' 'portaudio' 'sqlite3' 'liburcu')
makedepends=('tar')
optdepends=('ascii-chat')
provides=('libasciichat')
conflicts=('libasciichat')
options=('staticlibs' 'docs')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source_x86_64=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
               "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
source_aarch64=("$pkgname-$pkgver-Linux-arm64.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz"
                "$pkgname-$pkgver-Linux-arm64.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz.asc")
sha256sums_x86_64=('3f6beaa4d140481b7b04bdff875e815d12189ecbfa4a44518d472b98aefbcb5e'
                   'e35baf0410d849bdfc1d857b7c0c2d5e159db1d3f495fdc537411192c066f9fb')
sha256sums_aarch64=('3788f856ffaa11720a0083909c45234be632643a230c3c25a8dfa017b1083606'
                    '0a532a6fe3f5d909d427e74567fa6c36775f28772778a5e3b3ee98d14fba60f4')

package() {
  # Create directory structure
  mkdir -p "$pkgdir/usr"

  # Copy the prebuilt directory structure to /usr
  if [ -d "$srcdir/include" ]; then
    cp -r "$srcdir/include" "$pkgdir/usr/"
  fi
  if [ -d "$srcdir/lib" ]; then
    cp -r "$srcdir/lib" "$pkgdir/usr/"
  fi
  if [ -d "$srcdir/share" ]; then
    cp -r "$srcdir/share" "$pkgdir/usr/"
  fi

  # Copy etc if it exists
  if [ -d "$srcdir/etc" ]; then
    cp -r "$srcdir/etc" "$pkgdir/"
  fi

  # Install license if available
  if [ -f "$srcdir/LICENSE.txt" ]; then
    install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f "$srcdir/LICENSE" ]; then
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
