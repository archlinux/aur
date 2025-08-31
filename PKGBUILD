# Maintainer: Kevin <github@kev314.dev>

pkgname=noctalia-shell
pkgver=2.3.1
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
sha256sums=('f6a7ce7260500aafec1d12f8de49361624e40351c0bb7fca161378af3974e082')

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
