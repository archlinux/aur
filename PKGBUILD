# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=ccline-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="A high-performance Claude Code statusline tool written in Rust with Git integration and real-time usage tracking."
arch=('x86_64')
url="https://github.com/Haleclipse/CCometixLine"
license=('GPL3')
source=("ccline-linux-x64.tar.gz::https://github.com/Haleclipse/CCometixLine/releases/download/v1.0.8/ccline-linux-x64.tar.gz")
sha256sums=('2687b70ddeae48c1a2eba413eb1af6a18fd3cfcac0e51b8a6ba724055248cc8d')
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
