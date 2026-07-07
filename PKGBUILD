# Maintainer: hyperpuncher

pkgname=pi-ui-bin
pkgver=0.3.0
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
sha256sums_x86_64=('bf5369a04f532c056f51a3dbb0f7e16d1cf21422031b558959b73748f21f37ee')

source_aarch64=("$pkgname-$pkgver.AppImage::https://github.com/hyperpuncher/pi-ui/releases/download/v$pkgver/pi-ui-linux-arm64.AppImage")
sha256sums_aarch64=('1d6209da1ce919f498936dc39f8d25a573c3f32a420386eafde2cafdaa427060')

noextract=("$pkgname-$pkgver.AppImage")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver.AppImage" "$pkgdir/opt/pi-ui/pi-ui.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/pi-ui" <<'EOF'
#!/bin/sh
exec /opt/pi-ui/pi-ui.AppImage \
  --enable-blink-features=MiddleClickAutoscroll \
  --disable-spell-checking \
  "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pi-ui"
  install -Dm644 "$srcdir/pi-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/pi-ui.svg"
  install -Dm644 "$srcdir/pi-ui.desktop" "$pkgdir/usr/share/applications/pi-ui.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
