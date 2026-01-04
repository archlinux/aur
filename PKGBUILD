# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.6.0
pkgrel=1
pkgdesc="Video chat in your terminal"
arch=('x86_64' 'aarch64')
url="https://ascii-chat.com"
license=('MIT')
depends=()
makedepends=()
optdepends=(
  'v4l-utils: webcam device utilities'
  'openssh: ssh-agent support for key authentication'
)
provides=('ascii-chat')
conflicts=('ascii-chat')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source_x86_64=("$pkgname-$pkgver-Linux-amd64.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz"
               "$pkgname-$pkgver-Linux-amd64.tar.gz.asc::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-amd64.tar.gz.asc")
source_aarch64=("$pkgname-$pkgver-Linux-arm64.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz"
                "$pkgname-$pkgver-Linux-arm64.tar.gz.asc::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-Linux-arm64.tar.gz.asc")
sha256sums_x86_64=('0f90e6279d2474629c0f3849aca29e6d319f1286204b91fa7f63b149d5780c4f'
                   '53853711f453f428ea7521ceb866064e2296db6a369294a6dfbbebf5844c6da8')
sha256sums_aarch64=('de404f0f8cd02abc3456ab4ecdcfd1fe318705c47be7409329f05fac1a50efa5'
                    '22e370cc446ac539f30962edbdea048f62f7072600ac3be9177fe844acd1149e')

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
