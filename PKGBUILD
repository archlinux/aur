# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=cedet-git
_gitname=cedet
pkgver=9554.gcf21fa7
pkgrel=1
pkgdesc="Collection of Emacs Development Enviromnent Tools (Git version)"
arch=('any')
url="http://cedet.sourceforge.net/"
license=('GPL')
conflicts=(cedet cedet-cvs cedet-bzr)
replaces=(cedet-cvs cedet-bzr)
provides=('cedet')
depends=('emacs')
makedepends=('git')
source=('cedet::git+http://git.code.sf.net/p/cedet/git')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "${srcdir}"/${_gitname}
  printf "%s.g%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"/${_gitname}
 
  unset MAKEFLAGS
  make
}

package() {
  cd "$srcdir/${_gitname}"
  install -d $pkgdir/usr/share/emacs/site-lisp/cedet
  install cedet-devel-load.el cedet-remove-builtin.el $pkgdir/usr/share/emacs/site-lisp/cedet
  cp -a lisp contrib $pkgdir/usr/share/emacs/site-lisp/cedet

  # http://sourceforge.net/tracker/index.php?func=detail&aid=3585232&group_id=17886&atid=117886
  touch $pkgdir/usr/share/emacs/site-lisp/cedet/.nosearch

  # make INFODIR=$pkgdir/usr/share/info install-info
}
