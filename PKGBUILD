# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile4emacs-git
pkgver=r17322.d8d9a8d
pkgrel=1
pkgdesc="patched version of guile for guile-emacs"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/GuileEmacs"
license=('GPL')
depends=('gmp' 'gc' 'bash' 'libffi' 'libunistring' 'libltdl')
makedepends=('git')
provides=('guile')
conflicts=('guile')
options=('!strip' '!makeflags')
install=guile.install
source=("guile4emacs::git://git.hcoop.net/git/bpt/guile.git#branch=wip")
md5sums=('SKIP')
_gitname="guile4emacs"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  rm $pkgdir/usr/lib/libguile-2.2.so.0.0.0-gdb.scm
}
