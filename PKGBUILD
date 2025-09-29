# Maintainer: Nicholas Montgomery <dev@nickmont.net>
pkgname=projctl
pkgver=2.0.0
pkgrel=1
pkgdesc="Rust CLI to manage project context: switch, run, edit, git, logs, and tmux servers"
arch=('any')
url="https://github.com/nick-montgomery/projctl"
license=('MIT')

depends=()
makedepends=('cargo')

optdepends=(
  'neovim: default editor for `projctl edit`'
  'lazygit: default Git UI for `projctl git`'
  'tmux: required for `projctl servers`'
  'lnav: nicer log viewer for `projctl logs`'
  'tail: fallback log viewer for `projctl logs`'
)

source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('286932e4495bf73b80ce298ee5fb38935f7c6bd04d6f9df2987a21d5e5b6647e')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cargo build --release --locked --frozen
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
