# Maintainer: Kevin <github@kev314.dev>

pkgname=noctalia-shell
pkgver=2.4.0
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
depends=(
  'quickshell-git'
  'ttf-roboto'
  'inter-font' 
  'ttf-material-symbols-variable-git'
  'gpu-screen-recorder'
  'brightnessctl'
  'ddcutil'
)
optdepends=(
  'cliphist: For clipboard history support'
  'swww: Wallpaper animations and effects'
  'matugen-bin: Material You color scheme generation'
  'cava: Audio visualizer component'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('af70377e4c8ee6a754dbcf7a83df7030de9daba7eb9f9e3a6092a115f1c6ac87')

package() {
  cd "$srcdir/$pkgname"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia/"
  
  # Create wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/noctalia-shell" << 'EOF'
#!/bin/bash
exec qs -c noctalia "$@"
EOF
  chmod +x "$pkgdir/usr/bin/noctalia-shell"
}
