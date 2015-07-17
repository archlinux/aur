# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sly-git
pkgver=beta.37.gf13a5bf
pkgrel=1
pkgdesc="Common Lisp IDE for Emacs. Fork of slime."
arch=('any')
url="https://github.com/capitaomorte/sly"
license=('custom')
depends=('emacs')
makedepends=('git')
provides=('sly')
conflicts=('sly')
source=("git+https://github.com/capitaomorte/sly.git")
md5sums=('SKIP')
_gitname="sly"

pkgver() {
  cd "$srcdir"/"$_gitname"
  echo $(git describe --tags | sed 's|-|.|g' | cut -c7-)
}

build() {
  cd "$srcdir"/"$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d $pkgdir/usr/share/emacs/site-lisp/sly
  cp -r $srcdir/sly/* \
    $pkgdir/usr/share/emacs/site-lisp/sly
  
  install -d $pkgdir/usr/share/common-lisp/systems
  rm $pkgdir/usr/share/emacs/site-lisp/sly/doc/texinfo-tabulate.awk
  install -D -m644 README.md \
    $pkgdir/usr/share/licenses/$pkgname/public_domain.txt 
}
