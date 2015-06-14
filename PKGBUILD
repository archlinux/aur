# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop@nuclear.lu.se>
pkgname=htmlize-git
pkgver=20150122
pkgrel=1
pkgdesc="Convert buffer text and decorations to HTML"
url="http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git')

#source=("http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi")
#md5sums=('4c455a6daea159404aafb1a02611177b')
#it doesn't seem to do git anymore
_gitroot='http://fly.srk.fer.hr/~hniksic/emacs/htmlize.git'
_gitname=${pkgname}

package() {
  cd ${srcdir}
  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

#  msg "GIT checkout done or server timeout"
  install -m644 -D ${srcdir}/$_gitname/htmlize.el $pkgdir/usr/share/emacs/site-lisp/htmlize.el
}
