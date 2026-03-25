# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.1.8
pkgrel=1
pkgdesc="Fast tmux session manager"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemmist/lazy-tmux"
license=('MIT')
depends=()

source_x86_64=(
  "lazy-tmux_${pkgver}_linux_amd64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_${pkgver}_linux_amd64.tar.gz"
  "lazy-tmux_${pkgver}_linux_amd64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_${pkgver}_linux_amd64_fzf.tar.gz"
)
source_aarch64=(
  "lazy-tmux_${pkgver}_linux_arm64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_${pkgver}_linux_arm64.tar.gz"
  "lazy-tmux_${pkgver}_linux_arm64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_${pkgver}_linux_arm64_fzf.tar.gz"
)
sha256sums_x86_64=('57a91b1ad7ff5dd9e5e5fd681f6582255d152d727cb77106a3100e08249c61fa' '51cc2bd01eddce30c825ba1752937fc4b1ac34b74a6784c9730e800fa17d4fe1')
sha256sums_aarch64=('e8ece1961a2697845199cc6ff4b2e4478f7b6f4a8885dc8c26a1ee2fbbe34ad6' 'eeb367708fbc5f3dcf318220a66eb5dc40091c78736af36e01d2e79a5532b720')

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
