# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.2.4
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
sha256sums_x86_64=('448dca7b138e56017d65d35a268a15d21c89b5711210fa98df0ff544329851ff' '82597e3ef386ffec32e0c6b9bb1604f422a326bc10ca4a0751a817d3b1a7a263')
sha256sums_aarch64=('226bd601b93ff1ade74fef5bc0f5754cd7aa59778f79df2dbfd0addd438ce29f' '88b8c6c5b3084467197e66066e14510b19558bc8449998bb968dcc4bdc813e92')

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
