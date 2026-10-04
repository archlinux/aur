# Maintainer: nihitdev
pkgname=kairo-git
pkgver=0.1.0.r96.gea6c5ec
pkgrel=2
pkgdesc='Safe, interactive Arch workstation installer and curated Wayland dotfiles'
arch=(any)
url='https://github.com/nihitdev/kairo'
license=('GPL-3.0-only' 'MIT')
depends=(bash git)
optdepends=(
  'hyprland: Hyprland compositor configuration'
  'kitty: terminal configuration'
  'wezterm: modular terminal configuration'
  'zsh: WezTerm default shell'
  'zsh-autosuggestions: Zsh inline command suggestions'
  'zsh-completions: Extra Zsh completions'
  'zsh-history-substring-search: Zsh prefix/history search bindings'
  'zsh-syntax-highlighting: Zsh command-line syntax highlighting'
  'ttf-jetbrains-mono-nerd: WezTerm font and UI icons'
  'rofi: Wayland launcher and menu configuration'
  'waybar: status bar configuration'
  'quickshell: Kairo desktop shell runtime'
  'swaync: notification center configuration'
  'hyprpaper: Hyprland wallpapers'
  'hypridle: Hyprland idle management'
  'hyprlock: lock screen configuration'
  'cliphist: clipboard history menus'
  'wl-clipboard: Wayland clipboard and screenshots'
  'grim: screenshots'
  'slurp: screenshot region selection'
  'libnotify: screenshot and battery notifications'
  'wireplumber: volume controls'
  'brightnessctl: brightness controls'
  'playerctl: media controls'
  'python: desktop helpers and configuration validation'
  'jq: desktop IPC and JSON processing'
  'ttf-iosevka-nerd: desktop font and icons'
  'neovim: editor configuration'
  'fish: Fish shell configuration'
  'nushell: Nushell configuration'
  'starship: shell prompts'
  'btop: Waybar system monitor action'
  'pulsemixer: Waybar audio action'
  'networkmanager: Waybar network action'
  'bluetui: Waybar Bluetooth action'
  'cava: Waybar music visualizer action'
  'calcurse: Waybar calendar action'
  'yazi: file manager configuration and Waybar action'
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
  cp -a .config .local shell screenshots ./*.md LICENSE "$pkgdir/usr/share/kairo/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 VENDORED.md "$pkgdir/usr/share/licenses/$pkgname/VENDORED.md"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kairo" <<'EOF'
#!/usr/bin/env bash
exec bash /usr/share/kairo/install.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kairo"
}
