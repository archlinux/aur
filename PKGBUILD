# Maintainer: Kairo contributors
pkgname=kairo-git
pkgver=0.1.0.r75.gbba1d3a
pkgrel=1
pkgdesc='Safe, interactive Arch workstation installer and curated Wayland dotfiles'
arch=(any)
url='https://github.com/nihitdev/kairo'
license=(MIT)
depends=(bash git)
optdepends=(
  'hyprland: Hyprland compositor configuration'
  'kitty: terminal configuration'
  'rofi-wayland: launcher and menu configuration'
  'waybar: status bar configuration'
  'quickshell: Kairo desktop shell runtime'
)
provides=(kairo)
conflicts=(kairo)
source=("git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd kairo
  printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd kairo
  install -Dm755 install.sh "$pkgdir/usr/share/kairo/install.sh"
  cp -a .config shell README.md LICENSE "$pkgdir/usr/share/kairo/"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kairo" <<'EOF'
#!/usr/bin/env bash
exec bash /usr/share/kairo/install.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kairo"
}
