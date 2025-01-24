# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise-bin
pkgver=2025.1.14
pkgrel=1
pkgdesc='The front-end to your dev env'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
provides=('mise')
conflicts=('mise' 'rtx-bin' 'rtx')
replaces=('rtx-bin')
options=('!lto')
source=("mise-$pkgver.tar.gz::https://github.com/jdx/mise/releases/download/v$pkgver/mise-v$pkgver-linux-x64.tar.gz")
sha512sums=('421fbe2d0fb27c931a7b6da10db721241748c1d2692cf725895a095bbb2d92ecd7d0dccdbd569d482bdcd287d53ca77f3ddbaeb9224d1d08adf2a805ac6999a3')
optdepends=('usage-bin: completion support')

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
  install -Dm644 mise.fish "$pkgdir/usr/share/fish/vendor_completions.d/mise.fish"
  install -Dm644 _mise "$pkgdir/usr/share/zsh/site-functions/_mise"
}

check() {
    "$srcdir/mise/bin/mise" --version
}
