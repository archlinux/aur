# Maintainer: Milos <archlinux.7lpxv@simplelogin.co>

pkgname=zsh-claude-code-git
_pkgname=zsh-claude-code
pkgver=0.1.1.r7.g6aaa34f
pkgrel=1
pkgdesc="Claude-powered helpers for zsh: ask, explain, and natural-language-to-command widgets"
arch=('any')
url="https://github.com/matheus-poli/zsh-claude-code"
license=('MIT')
depends=('zsh')
makedepends=('git')
optdepends=('claude-code: the claude CLI the plugin wraps (any install method on $PATH works)')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$_pkgname"
  for f in zsh-claude-code.plugin.zsh lib/*.zsh; do
    zsh -n "$f"
  done
}

package() {
  cd "$_pkgname"
  local dest="$pkgdir/usr/share/zsh/plugins/$_pkgname"
  install -Dm644 zsh-claude-code.plugin.zsh -t "$dest"
  install -Dm644 lib/*.zsh -t "$dest/lib"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
