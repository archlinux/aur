# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.3
pkgrel=1
pkgdesc="Fast tmux session manager"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemmist/lazy-tmux"
license=('MIT')
depends=()

source_x86_64=(
  "lazy-tmux_${pkgver}_linux_amd64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_amd64.tar.gz"
  "lazy-tmux_${pkgver}_linux_amd64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_amd64_fzf.tar.gz"
)
source_aarch64=(
  "lazy-tmux_${pkgver}_linux_arm64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_arm64.tar.gz"
  "lazy-tmux_${pkgver}_linux_arm64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_arm64_fzf.tar.gz"
)
sha256sums_x86_64=('eaad5696efd2c5a32f099926bb69fb51d1bf4c0bc8656ec889dee24c5e3a5231' '2a5da4dab859eb801b2c6cadb12a2604cdbb165715e9506de9dd8734d2e70c79')
sha256sums_aarch64=('749722e5d4eb9cdd077d5ddce62b4fce4692bb3cb7cda5cd069bb23f9fd0fda5' 'ab8294db78a4c8009020c528818b5c00905629e67f03959c79426c29327d8821')

_package_arch_suffix() {
  case "$CARCH" in
    x86_64) echo "amd64" ;;
    aarch64) echo "arm64" ;;
    *) echo "unsupported arch: $CARCH" >&2; return 1 ;;
  esac
}

package_lazy-tmux() {
  local archsuffix
  archsuffix="$(_package_arch_suffix)"
  install -d "$pkgdir/usr/bin"
  tar -xzf "$srcdir/lazy-tmux_${pkgver}_linux_${archsuffix}.tar.gz" -C "$pkgdir/usr/bin"
  chmod +x "$pkgdir/usr/bin/lazy-tmux"
}

package_lazy-tmux-fzf() {
  local archsuffix
  archsuffix="$(_package_arch_suffix)"
  install -d "$pkgdir/usr/bin"
  tar -xzf "$srcdir/lazy-tmux_${pkgver}_linux_${archsuffix}_fzf.tar.gz" -C "$pkgdir/usr/bin"
  if [ -f "$pkgdir/usr/bin/lazy-tmux" ]; then
    mv "$pkgdir/usr/bin/lazy-tmux" "$pkgdir/usr/bin/lazy-tmux-fzf"
  fi
  chmod +x "$pkgdir/usr/bin/lazy-tmux-fzf"
}
