# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-goby-git
pkgver=1.1.13.gea799f9
pkgrel=2
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
sha256sums=('SKIP'
            '21d7b7a32535aa6cb0b3500f955f1cc3e9327c93c8e15e8310aa61b56f39e24a')

pkgver() {
 cd Goby
 git describe --tags | sed 's|-|.|g' |cut -c2-
}

build() {
  cd Goby
  make 
}

package() {
  cd Goby
  install -d "$pkgdir"/usr/share/emacs/site-lisp/goby
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  make PREFIX="$pkgdir"/usr install
}
