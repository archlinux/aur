# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sly-git
pkgver=2.21.r67.g893a939a
pkgrel=1
pkgdesc="Common Lisp IDE for Emacs. Fork of slime."
arch=('any')
url="https://github.com/joaotavora/sly"
license=('custom')
depends=('emacs' 'gawk' 'common-lisp')
makedepends=('git')
provides=('sly' 'emacs-sly')
conflicts=('sly' 'emacs-sly')
source=("emacs-sly::git+https://github.com/joaotavora/sly.git")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags | cut -c15- | sed 's+-+.r+' | tr - .)
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/sly
  cp -r "$srcdir"/${pkgname%-git}/* \
    "$pkgdir"/usr/share/emacs/site-lisp/sly
  install -D -m644 README.md \
    "$pkgdir"/usr/share/licenses/$pkgname/public_domain.txt 
}
