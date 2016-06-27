# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wart-git
pkgver=4125.47e3572
pkgrel=1
pkgdesc="A small, readable lisp with thorough unit tests and extensible functions/macros."
arch=('i686' 'x86_64')
url="https://github.com/akkartik/wart"
license=('Artistic2.0')
depends=('gcc-libs' 'bash')
makedepends=('git')
provides=('wart')
conflicts=('wart')
source=('git://github.com/akkartik/wart.git' 'wart.sh')
md5sums=('SKIP'
         '4be136701bd4c80ff98b907e70d9131b')
optdepends=('which: for using rlwrap'
  'rlwrap: for better REPL editing'
  'zsh: for using zsh')
options=('!strip')
_gitname="wart"

pkgver() {
 cd $srcdir/$_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  make -q || make 
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/$_gitname
  cp -r $_gitname $pkgdir/usr/share
  # avoid having a binary under /usr/share
  install -Dm755 $pkgdir/usr/share/wart/wart_bin \
    $pkgdir/usr/bin/wart_bin
  rm $pkgdir/usr/share/wart/wart_bin
  install -Dm755 $srcdir/wart.sh $pkgdir/usr/bin/wart
}
