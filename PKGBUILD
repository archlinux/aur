# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
_base=j-mode
pkgname=emacs-${_base}-git
pkgver=1.1.1.10.ge8725ac
pkgrel=1
pkgdesc="Emacs-mode for the J language"
arch=(any)
url="https://github.com/zellio/${_base}"
license=(GPL3)
depends=(emacs)
makedepends=(git)
provides=(emacs-${_base})
conflicts=(emacs-${_base})
install=${pkgname}.install
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --tags | sed 's|-|.|g' | sed 's+^v++'
}

build() {
  cd ${_base}
  for _i in *.el; do
    emacs --batch -q --eval "(byte-compile-file \"${_i}\")"
  done
}

package() {
  cd ${_base}
  for _i in *.el *.elc; do
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp/${_i}
  done
}
