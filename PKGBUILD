# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.5.51
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
sha256sums=('d1b50cbc20754a6587f6d8c00777a4f556c40d5cbf59a1a3a6f19c5f57a2fd8a'
            'bb48ba509a80741ed3d46aa181241ca01f2f4249623552466fe6da380306dd67')

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
