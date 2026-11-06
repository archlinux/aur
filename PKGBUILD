# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.4
pkgrel=2
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
sha256sums_x86_64=('c947ea83f43c434de4560eb58aafa3c9ac5f998379932ccb0bffaa5f022ba239' '2c86bac4633d56f4b24f1a76105b1bc333cf10f8ae8702b002b099205cc9d7dd')
sha256sums_aarch64=('4470dec213318d88c519f2d4a2b8d526eb7ede59441f063d6382aba40cf0aef7' '1d682e5ca9d5251caed1b7bdf8c417895eea5ac446f223d73f6d7b72437533a9')

_package_arch_suffix() {
  case "$CARCH" in
    x86_64) echo "amd64" ;;
    aarch64) echo "arm64" ;;
    *) echo "unsupported arch: $CARCH" >&2; return 1 ;;
  esac
}

_package_release() {
  local suffix="$1" binary="$2" archsuffix staging
  archsuffix="$(_package_arch_suffix)"
  staging="$(mktemp -d)"
  tar -xzf "$srcdir/lazy-tmux_${pkgver}_linux_${archsuffix}${suffix}.tar.gz" -C "$staging"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$binary" "$pkgdir/usr/share/doc/$binary"
  install -m755 "$staging/lazy-tmux" "$pkgdir/usr/bin/$binary"
  install -m644 "$staging/LICENSE" "$pkgdir/usr/share/licenses/$binary/LICENSE"
  install -m644 "$staging/README.md" "$pkgdir/usr/share/doc/$binary/README.md"
  rm -rf "$staging"
}

package_lazy-tmux() {
  _package_release "" "lazy-tmux"
}

package_lazy-tmux-fzf() {
  _package_release "_fzf" "lazy-tmux-fzf"
}
