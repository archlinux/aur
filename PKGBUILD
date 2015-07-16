# contributor: zhuqin <zhuqin83@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-org-mode-git
pkgver=8.3beta.1287.ged6349d
pkgrel=1
pkgdesc="Emacs Org Mode from git"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
makedepends=('git' 'texlive-core' 'perl' 'awk')
optdepends=('java-environment: for using ditaa.jar in the contrib directory'
	   'zsh: for using dir2org.zsh in the contrib directory')
license=('GPL')
provides=("emacs-org-mode=$pkgver")
conflicts=('emacs-org-mode')
install=emacs-org-mode.install
source=('emacs-org-mode::git://orgmode.org/org-mode.git')
md5sums=('SKIP')
optdepends=('zsh: for running dir2org.zsh in the org-contrib/scripts dir'
	    'java-environment: for running ditaa.jar in the org-contrib/scripts dir')
_gitname="emacs-org-mode"

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --tags | sed 's+-+.+g' | cut -c9-
}

package () {
  cd $srcdir/$_gitname
  sed -i '30s+autoloads++' mk/targets.mk
  make prefix=$pkgdir/usr/share install
  mv $pkgdir/usr/share/info/org $pkgdir/usr/share/info/orgmode
  install -d $pkgdir/usr/share/emacs/site-lisp/org_contrib
  cp -r contrib/{lisp,scripts} $pkgdir/usr/share/emacs/site-lisp/org_contrib
  rm $pkgdir/usr/share/emacs/site-lisp/org/org-{loaddefs.el,version.el}
}
