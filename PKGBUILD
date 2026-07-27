pkgname=vgs-shell
pkgver=0.1.0
pkgrel=2
pkgdesc='VanillaGreen desktop shell for Hyprland and Niri'
arch=('x86_64' 'aarch64')
url='https://github.com/vanillagreencom/vgs'
license=('MIT')
depends=('quickshell' 'jq' 'python' 'systemd')
optdepends=('hyprland: reference compositor' 'niri: scrolling compositor' 'wl-clipboard: clipboard history')
source_x86_64=("$url/releases/download/v$pkgver/vgs-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/vgs-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('a0bc9dfe74a9eb76513608b196ae11153dee89b370d30bf5121a9256fc23cec5')
sha256sums_aarch64=('dee66ae3d7f81d63f6f2634b81bf487ce53a11e67635b4bfbc2a933a4e79656e')

package() {
  cd "vgs-$pkgver-linux-$CARCH"
  sed -i 's|^#!/bin/env bash$|#!/usr/bin/env bash|' config/vshell/nvim/colorschemes/tokyonight.nvim/scripts/{build,docs}
  DESTDIR="$pkgdir" VGS_BACKEND_BINARY="$PWD/bin/vshell-backend" packaging/install-system.sh
}