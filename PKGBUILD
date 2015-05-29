# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=emacs-navi2ch-git
pkgver=1225.faebfd1
pkgrel=1
pkgdesc="A '2ch bbs' browser worked on Emacsen."
arch=( 'any' )
url="http://navi2ch.sourceforge.net/"
license=('GPL2')
depends=('emacs')
makedepends=('git')
provides=(emacs-navi2ch)
conflicts=(emacs-navi2ch)
install=navi2ch.install
source=("${pkgname%-git}"::'git://github.com/naota/navi2ch.git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Use the tag of the last commit
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/${pkgname%-git}"

  # ./autogen.sh
  ./configure --prefix=/usr \
              --with-lispdir=/usr/share/emacs/site-lisp/navi2ch \
              --with-icondir=/usr/share/icons/navi2ch
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
} 

# vim:set ts=2 sw=2 et:
