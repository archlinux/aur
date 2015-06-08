# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-goby-git
pkgver=1.1.9.g30fe6bb
pkgrel=1
pkgdesc="WYSIWYG presentation tool, which runs on Emacs"
arch=('any')
url="http://www.mew.org/~kazu/proj/goby/en/index.html"
license=('custom:BSD')
depends=('emacs')
makedepends=('git')
optdepends=('netpbm: for using images' 'imagemagic: for making screen dumps')
provides=('emacs-goby')
conflicts=('emacs-goby')
install=emacs-goby.install
source=("git+https://github.com/kazu-yamamoto/Goby.git" LICENSE)
md5sums=('SKIP' 'a774f696f08d52a017e391c578870c4d')
_gitname="Goby"

pkgver() {
 cd "$srcdir"/"$_gitname"
 git describe --tags | sed 's|-|.|g' |cut -c2-
}
prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's/MKDIR   = mkdir/MKDIR   = install -d/' Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make 
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 "$srcdir/LICENSE" \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make PREFIX="$pkgdir/usr" install
}
