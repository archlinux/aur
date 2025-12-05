# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.6.2
_tag="v$pkgver"
pkgrel=2
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
options=('!strip')
depends=('pacman' 'curl' 'bash' 'sudo' 'coreutils' 'grep' 'xdg-utils')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'rate-mirrors: Artix mirror rating'
    'alacritty: run external commands in a terminal'
    'kitty: run external commands in a terminal'
    'ghostty: run external commands in a terminal'
    'xterm: run external commands in a terminal'
    'gnome-terminal: run external commands in a terminal'
    'konsole: run external commands in a terminal'
    'xfce4-terminal: run external commands in a terminal'
    'tilix: run external commands in a terminal'
    'mate-terminal: run external commands in a terminal'
    'neovim: external editor'
    'vim: external editor'
    'emacs: external editor'
    'helix: external editor'
    'nano: external editor'
    'klipper: clipboard manager on X11'
    'clamav: malware scanning of files'
    'trivy: vulnerability scanning'
    'semgrep-bin: static analysis checks'
    'shellcheck: lint shell scripts'
    'downgrade: Downgrade of Packages'
)
provides=("pacsea=${pkgver}")
conflicts=('pacsea' 'pacsea-git')
source=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/Pacsea"
        "Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('bd10bed3c3e3c8230a2d345dfd0c69f13623d48ef73a240217ae25e765fe10cd'
            '540cd8f5ebc16ae97129bf278cbae535829c6e9c1f39815dd88837609c37fab3')

package() {
  # GitHub tarballs from tags extract to Pacsea-<version> (without 'v' prefix)
  cd "$srcdir/Pacsea-${pkgver}" || exit 1
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install i18n configuration
  install -Dm644 "config/i18n.yml" "$pkgdir/usr/share/pacsea/config/i18n.yml"
  
  # Install locale files
  install -d "$pkgdir/usr/share/pacsea/locales"
  install -m644 config/locales/*.yml "$pkgdir/usr/share/pacsea/locales/"
}
