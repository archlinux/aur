# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Desktop GUI for pi"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/pi-ui"
license=('MIT')
depends=('fuse2')
provides=("pi-ui=$pkgver")
conflicts=('pi-ui')

source=("pi-logo.svg" "pi-ui.desktop" "LICENSE")
sha256sums=(
  'a5624bc3b8cac94de75f6f13701eca2ad3ef67bbeba286c4af3f398806f0858a'
  'e22214365f6c7f8537be9dcc2b50c1af97cc197e5d159677b0408e29f80bd182'
  '6b7faf66323093e92a63a7d6d0cd20ef3718b77a2192e06cb00466fe870f14cf'
)

source_x86_64=("$pkgname-$pkgver.AppImage::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-x64.AppImage")
sha256sums_x86_64=('41702dd64712bb35bfcea383433045f7f27c36383b0946a8ddad6bf0c8e9529c')

source_aarch64=("$pkgname-$pkgver.AppImage::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.AppImage")
sha256sums_aarch64=('5b0f3c3e8bb9a482adcd0993bd30c3268201026e97e0e741d6bcff4f1b813e24')

noextract=("$pkgname-$pkgver.AppImage")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" "$pkgdir/opt/pi-ui/pi-ui.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/pi-ui" <<'EOF'
#!/bin/sh
exec /opt/pi-ui/pi-ui.AppImage \
  --enable-blink-features=MiddleClickAutoscroll \
  --disable-frame-rate-limit \
  --disable-gpu-vsync \
  --disable-spell-checking \
  "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/pi-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pi-ui.svg"
  install -Dm644 "$srcdir/pi-ui.desktop" "$pkgdir/usr/share/applications/pi-ui.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
