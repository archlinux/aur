# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat
pkgver=0.5.64
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat - prebuilt"
arch=('x86_64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=('zstd' 'libsodium' 'opus' 'mimalloc' 'portaudio')
makedepends=('tar')
optdepends=('ascii-chat')
provides=('libasciichat')
conflicts=('libasciichat')
options=('staticlibs' 'docs')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
        "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
sha256sums=('d9d62b59fa30a5db1f08d580773886e76cf4ecd7d7af0dce614b1187e04d3ee1'
            '979a02b8333a1f0ba26ddfbf835f2e9cc28067b555fe1b7e1fdbdfcad87a6d47')

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
