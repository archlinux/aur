
pkgname='lockbook'
_pkgname="lockbook"
pkgver=0.8.2
pkgrel=1
arch=('any')
url="https://github.com/lockbook/lockbook"
pkgdesc="The private, polished note-taking platform."
license=('BSD-3-Clause')
makedepends=('cargo' 'git')
provides=('lockbook')
conflicts=('lockbook')
source=("git+https://github.com/lockbook/lockbook.git#tag=$pkgver")
sha256sums=('SKIP')
groups=('lockbook')

pkgver() {
  cd $srcdir/lockbook/clients/cli
  echo "0.8.2"
}

build() {
  cd $srcdir/lockbook/clients/cli
  cargo build --release --locked
}

package_lockbook() {
  cd $srcdir/lockbook
  install -D -m755 "target/release/lockbook" "$pkgdir/usr/bin/lockbook"

  lockbook completions bash > lockbook_completions.bash
  lockbook completions zsh > lockbook_completions.zsh
  lockbook completions fish > lockbook_completions.fish

  install -Dm644 lockbook_completions.bash "$pkgdir/usr/share/bash-completion/completions/lockbook"
  install -Dm644 lockbook_completions.zsh "$pkgdir/usr/share/zsh/site-functions/_lockbook"
  install -Dm644 lockbook_completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/lockbook.fish"
}
