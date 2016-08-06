# Contributed by ivoarch <ivkuzev@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=aurel-git
pkgver=0.8.2016_03_09
pkgrel=1
pkgdesc="Search and download AUR packages from Emacs"
arch=('any')
url="https://github.com/alezost/aurel"
license=('GPL')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=("git+https://github.com/alezost/aurel.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf %s.%s $(git describe --tags| cut -c2-) $(git log -1 --format="%cd" --date=short | tr - _)
}

build() {
  cd "$srcdir/${pkgname%-git}"
  emacs --batch -f batch-byte-compile *.el >&/dev/null
}

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"

  cd "$srcdir/${pkgname%-git}"
  install -d $_pkg_emacs
  cp *.el *.elc $_pkg_emacs
}
