
pkgname='lockbook'
_pkgname="lockbook"
pkgver=26.7.4
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
options=(!lto)
depends=('nfs-utils')

pkgver() {
  cd $srcdir/lockbook/clients/cli
  echo "26.7.4"
}

build() {
  cd $srcdir/lockbook/clients/cli
  cargo build --release --locked
}

package_lockbook() {
  cd $srcdir/lockbook
  install -D -m755 "target/release/lockbook" "$pkgdir/usr/bin/lockbook"

  $pkgdir/usr/bin/lockbook completions bash > lockbook_completions.bash
  $pkgdir/usr/bin/lockbook completions zsh > lockbook_completions.zsh
  $pkgdir/usr/bin/lockbook completions fish > lockbook_completions.fish

  install -Dm644 lockbook_completions.bash "$pkgdir/usr/share/bash-completion/completions/lockbook"
  install -Dm644 lockbook_completions.zsh "$pkgdir/usr/share/zsh/site-functions/_lockbook"
  install -Dm644 lockbook_completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/lockbook.fish"
}
