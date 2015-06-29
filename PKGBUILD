# Maintainer: sumito3478 <sumito3478gmail.com>

pkgname=emacs-color-theme-xoria256
pkgver=20130429
pkgrel=1
pkgdesc="Emacs port of Dmitriy Zotikov's xoria256 vim theme"
arch=(any)
license=('unknown')
url="https://github.com/pat-rondon/color-theme-xoria256"
depends=('emacs' 'emacs-color-theme')
makedepends=('git')

_gitroot="https://github.com/pat-rondon/color-theme-xoria256.git"
_gitname=color-theme-xoria256

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  emacs --batch --eval '(progn (push "." load-path) (byte-compile-file "color-theme-xoria256.el"))'
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 ${pkgdir}/usr/share/emacs/site-lisp/themes || return 1
  install -D -m644 *.el *.elc ${pkgdir}/usr/share/emacs/site-lisp/themes || return 1
}
