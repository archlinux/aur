# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.1.13
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
sha256sums_x86_64=('f75bdfe62c5b85a2904fcc2bc01a845afffb69ab86855baf20aff316b83c8b33' '574ace88ea9d3011a35352ee29f6a71b43e3d1599072fc429498aa36ccbbd9f5')
sha256sums_aarch64=('e4f033f2a75c0436c94f1f8543a604aea472a857f3d98ef231b4293dc27101ba' 'c75f939d846d27b2dbb094b219e8f1c653e93e391dfea1c67167d860baab0cf1')

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
