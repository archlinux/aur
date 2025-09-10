# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=ccline-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A high-performance Claude Code statusline tool written in Rust with Git integration and real-time usage tracking."
arch=('x86_64')
url="https://github.com/Haleclipse/CCometixLine"
license=('GPL3')
source=("ccline-linux-x64.tar.gz::https://github.com/Haleclipse/CCometixLine/releases/download/v1.0.5/ccline-linux-x64.tar.gz")
sha256sums=('22ea70649cb26eb7fea2eff8854d1880f53ba459e17163214e06015ea8fe9da8')
install=ccline-bin.install

package() {
  # Extract the tar.gz file
  tar -xzf "$srcdir/ccline-linux-x64.tar.gz" -C "$srcdir"

  # Check if ~/.claude/ directory exists
  if [ ! -d "$HOME/.claude" ]; then
    echo "Error: ~/.claude/ directory does not exist."
    echo "Please install claude-code first before installing this package."
    return 1
  fi

  # Create ~/.claude/ccline directory and install the binary
  install -d "$HOME/.claude/ccline"
  install -Dm755 "$srcdir/ccline" "$HOME/.claude/ccline/ccline"

  # Create system link to the binary
  install -d "$pkgdir/usr/bin"
  ln -sf "$HOME/.claude/ccline/ccline" "$pkgdir/usr/bin/ccline"
}
