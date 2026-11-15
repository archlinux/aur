# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.16.30
pkgrel=1
pkgdesc="Video chat in your terminal"
arch=('x86_64' 'aarch64')
url="https://ascii-chat.com"
license=('MIT')
depends=()
makedepends=()
optdepends=(
  'gnupg: GPG key support for authentication'
  'openssh: SSH key agent support for authentication'
  'v4l-utils: webcam device utilities'
  'yt-dlp: YouTube video source support'
)
provides=('ascii-chat')
conflicts=('ascii-chat')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source_x86_64=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
               "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
source_aarch64=("$pkgname-$pkgver-Linux-arm64.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz"
                "$pkgname-$pkgver-Linux-arm64.tar.gz.asc::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz.asc")
sha256sums_x86_64=('72a647a3b0dd6d6ab68a23268085ca4c672799dc8f97b92388f1c5b2f6703e14'
                   'd2e513aa98c74dec6b4c58b58e36bae70555f873336d4f36a7808827bf9214a5')
sha256sums_aarch64=('5f4a8e7ae4617bcb4ed8eedea38987965b695651fbca22e8191cf219939186bf'
                    '5d1194124e7e26c6318a21dabe53f47ffb7abdde06351eec8415561751c7eda2')

package() {
  # Create directory structure
  mkdir -p "$pkgdir/usr"

  # Copy the prebuilt directory structure to /usr
  cp -r "$srcdir/bin" "$pkgdir/usr/"
  cp -r "$srcdir/share" "$pkgdir/usr/"

  # Copy lib if it exists (systemd services)
  if [ -d "$srcdir/lib" ]; then
    cp -r "$srcdir/lib" "$pkgdir/usr/"
  fi

  # Copy etc if it exists
  if [ -d "$srcdir/etc" ]; then
    cp -r "$srcdir/etc" "$pkgdir/"
  fi

  # Install license
  if [ -f "$srcdir/share/doc/$pkgname/LICENSE.txt" ]; then
    install -Dm644 "$srcdir/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f "$srcdir/share/doc/$pkgname/LICENSE" ]; then
    install -Dm644 "$srcdir/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
