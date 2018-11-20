# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sly-git
pkgver=1.0.0.beta.498.gc338f22c
pkgrel=1
pkgdesc="Common Lisp IDE for Emacs. Fork of slime."
arch=('any')
url="https://github.com/capitaomorte/sly"
license=('custom')
depends=('emacs' 'gawk')
makedepends=('git')
provides=('sly' 'emacs-sly')
conflicts=('sly' 'emacs-sly')
source=("emacs-sly::git+https://github.com/capitaomorte/sly.git")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags | sed 's|-|.|g')
}

# prepare () {
#   cd ${pkgname%-git}/contrib
#   # some files cannot be byte-compiled
#   mv sly-fancy.el doof1
#   mv sly-stickers.el doof2
# }

build() {
  cd ${pkgname%-git}
  make
  # reverting the prepare step to include the not byte-compiled files
  # cd contrib
  # mv doof1 sly-fancy.el
  # mv doof2 sly-stickers.el
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/sly
  cp -r "$srcdir"/${pkgname%-git}/* \
    "$pkgdir"/usr/share/emacs/site-lisp/sly
  install -D -m644 README.md \
    "$pkgdir"/usr/share/licenses/$pkgname/public_domain.txt 
}
