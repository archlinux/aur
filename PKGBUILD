# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.5.64
pkgrel=1
pkgdesc="Video chat in your terminal - prebuilt binary"
arch=('x86_64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=()
makedepends=('tar')
optdepends=(
  'v4l-utils: webcam device utilities'
  'openssh: ssh-agent support for key authentication'
)
provides=('ascii-chat')
conflicts=('ascii-chat')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
        "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
sha256sums=('ab4e25c54dbb07b6a4108aaaa113a71d74c9d23974c0a59ccd92d7a8b674c382'
            '2930c0d1cf703e05a97e8975eae49cc9fff192517527fcd8c7f65fcec9fd7713')

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
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
