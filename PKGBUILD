# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise-bin
pkgver=2024.1.7
pkgrel=1
pkgdesc='The front-end to your dev env'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
provides=('mise')
conflicts=('mise' 'rtx-bin' 'rtx')
replaces=('rtx-bin')
options=('!lto')
source=("mise-$pkgver.tar.gz::https://github.com/jdx/mise/releases/download/v2024.1.7/mise-v2024.1.7-linux-x64.tar.gz")
sha512sums=('0cc7a01793b15daf9b755fe327f1c03157b81ecf4f7356ce742009ec0e1353624a3bb3d339a67f443c975ac2fdcaebd3caaa24ee7f535e820bff082687ea0311')

build() {
  cd "$srcdir/"
  mise/bin/mise completions bash > mise.bash
  mise/bin/mise completions fish > mise.fish
  mise/bin/mise completions zsh > _mise
}

package() {
  cd "$srcdir/"
  install -Dm755 mise/bin/mise "$pkgdir/usr/bin/mise"
  install -Dm644 mise/man/man1/mise.1 "$pkgdir/usr/share/man/man1/mise.1"
  install -Dm644 mise.bash "$pkgdir/usr/share/bash-completion/completions/mise"
  install -Dm644 mise.fish "$pkgdir/usr/share/fish/completions/mise.fish"
  install -Dm644 _mise "$pkgdir/usr/share/zsh/site-functions/_mise"
}

check() {
    "$srcdir/mise/bin/mise" --version
}
