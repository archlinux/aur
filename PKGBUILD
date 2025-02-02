# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise-bin
pkgver=2025.2.0
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
sha512sums=('46d5117bc15d3209dbc852a65e51932cca203e6320195c94640243101625f2a59f52c39dc75757daba7e65e8c9a55009986b446dc483c7a400884ad63bf76d4a')
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
