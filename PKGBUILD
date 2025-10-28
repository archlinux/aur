# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.4.4
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
  'pacman-mirror: Manjaro mirrorlist'
  'alacritty: run external commands in a terminal'
  'kitty: run external commands in a terminal'
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
  'downgrade: Downgrade of Packages'
)
provides=("pacsea=${pkgver}")
conflicts=('pacsea' 'pacsea-git')
source=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/Pacsea"
        "Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('b239d9d5b4250fad80b2c70d57804e005fed52b1b0b1ee9c093479a4e9d28caa'
            '5abfc5c4415ccc2e362854ffdb3ed4286ae46220027c01a19651bc58ea57518a')

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"

  # Install binary (release asset is named 'Pacsea'; install as lowercase 'pacsea')
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license and documentation from tagged source tarball
  install -Dm644 "$srcdir"/Pacsea-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir"/Pacsea-*/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
