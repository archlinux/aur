# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wart-git
pkgver=4134.g789671d7
pkgrel=1
epoch=1
pkgdesc="A small, readable lisp with thorough unit tests and extensible functions/macros."
arch=('i686' 'x86_64')
url="https://github.com/akkartik/wart"
license=('Artistic2.0')
depends=('gcc-libs' 'bash')
makedepends=('git')
provides=('wart')
conflicts=('wart')
source=("git+$url.git#branch=main" 'wart.sh')
sha256sums=('SKIP'
            'f1e09fbfc74b3e8775e9afc53f3101c378be846f89f365bf5c66d8a3611740f3')
optdepends=('which: for using rlwrap'
  'rlwrap: for better REPL editing'
  'zsh: for using zsh')
options=('!strip' '!makeflags')
_gitname="wart"

pkgver() {
  cd $_gitname
  printf %s.g%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  make 
}

package() {
  install -d "$pkgdir"/usr/share/$_gitname
  cp -r $_gitname "$pkgdir"/usr/share
  # avoid having a binary under /usr/share
  install -Dm755 "$pkgdir"/usr/share/wart/wart_bin \
    "$pkgdir"/usr/bin/wart_bin
  rm "$pkgdir"/usr/share/wart/wart_bin
  install -Dm755 "$srcdir"/wart.sh "$pkgdir"/usr/bin/wart
  rm -r "$pkgdir"/usr/share/wart/.git
}
