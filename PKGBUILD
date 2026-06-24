# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.1.17
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
sha256sums_x86_64=('226b313d736395831ae448f4495333d3056352097d56f90ef2bffff1c7acfd13' '1381cb38932e9ae625fccc504f8b81de005254b0374521213c13d0da3088ef9d')
sha256sums_aarch64=('a2a32d95a18418899c4b152dd46fe287a3e1a8238b31b4e9462a365938d6f51c' 'b03f6e8433d658b569b44f7651032d8ed01845f3ebebcc28610f361cfa23bcab')

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
