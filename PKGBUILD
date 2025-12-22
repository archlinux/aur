# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=ccline-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="A high-performance Claude Code statusline tool written in Rust with Git integration and real-time usage tracking."
arch=('x86_64')
url="https://github.com/Haleclipse/CCometixLine"
license=('GPL3')
source=("ccline-linux-x64.tar.gz::https://github.com/Haleclipse/CCometixLine/releases/download/v1.0.9/ccline-linux-x64.tar.gz")
sha256sums=('54126d93a884509d7fd9990cab92e49dc8467bf61cbd0b13c0bc9de7438f2b79')
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
