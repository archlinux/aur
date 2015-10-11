# Contributor: Kyle Sexton <ks@mocker.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-pkgbuild-mode-git
pkgver=0.14.1.5.g5036e2d
pkgrel=1
pkgdesc="A major mode for creating packages with emacs"
arch=('any')
url="https://github.com/stefanhusmann/pkgbuild-mode"
license=('GPL')
depends=('emacs' 'pkgbuild-introspection')
makedepends=('git')
provides=('emacs-pkgbuild-mode')
conflicts=('emacs-pkgbuild-mode')
install=emacs-pkgbuild-mode.install
source=('git+https://github.com/stefanhusmann/pkgbuild-mode.git')
md5sums=('SKIP')
_gitname="pkgbuild-mode"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed s+-+.+g
}

build() {
  cd "$srcdir/$_gitname"
  emacs -batch -f batch-byte-compile pkgbuild-mode.el 
}

package() {
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/$_gitname/*.el* \
	  $pkgdir/usr/share/emacs/site-lisp/
  install -Dm755 $srcdir/$_gitname/prepare_4_aur4.sh \
	  $pkgdir/usr/bin/prepare_4_aur4.sh
}

