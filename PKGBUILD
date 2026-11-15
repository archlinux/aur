# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat
pkgver=0.16.30
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat"
arch=('x86_64' 'aarch64')
url="https://ascii-chat.com"
license=('MIT')
depends=('ffmpeg' 'fontconfig' 'freetype2' 'fftw' 'icu' 'libsodium'
         'libnghttp2' 'libnghttp3' 'libngtcp2' 'libuv' 'libutf8proc'
         'libwebsockets' 'mimalloc' 'openssl' 'opus' 'pcre2' 'portaudio'
         'sqlite3' 'zstd')
makedepends=('tar')
optdepends=(
  'ascii-chat: ascii-chat runtime'
  'gnupg: GPG key support for authentication'
  'openssh: SSH key agent support for authentication'
  'yt-dlp: YouTube video source support'
)
provides=('libasciichat')
conflicts=('libasciichat')
options=('staticlibs' 'docs')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source_x86_64=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
               "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
source_aarch64=("$pkgname-$pkgver-Linux-arm64.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz"
                "$pkgname-$pkgver-Linux-arm64.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz.asc")
sha256sums_x86_64=('03de704b784f39a9e66fbf9950ac624c37824738be9d27bb8b45cbb32a04f449'
                   '9da269d658fd87eae59792a8aaa31b66e989abb96d59840501fc490e9fc4ec61')
sha256sums_aarch64=('6685a147a3ea3b0b8e6dc8495cdd20030c2ea78ad7887dafdb7d88416d3a5911'
                    'b2f691ab213ca841115498870739f83620319de279986f802730c392ee767a9b')

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
