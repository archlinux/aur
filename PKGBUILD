# Maintainer: Jeff Dickey <releases at mise dot jdx dot dev>

pkgname=mise-bin
pkgver=2024.4.12
pkgrel=1
pkgdesc='The front-end to your dev env'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
provides=('mise')
conflicts=('mise' 'rtx-bin' 'rtx')
replaces=('rtx-bin')
options=('!lto')
source=("mise-$pkgver.tar.gz::https://github.com/jdx/mise/releases/download/v2024.4.12/mise-v2024.4.12-linux-x64.tar.gz")
sha512sums=('317e3cf7ef56aac402eae7906187d076cd1f46f9619b537fb5be47af89057d848e0c0a6a431f2f67ab2c42ef589f44d8d470eca0101f42ef68b81b874074eaa4')

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
