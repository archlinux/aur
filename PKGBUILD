# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cesar Romero <cesar.romero@gmail.com>

pkgname=emacs-color-theme
pkgver=6.6.0
pkgrel=10
arch=('any')
pkgdesc="Emacs color themes"
url="http://www.nongnu.org/color-theme/"
license=('GPL2')
depends=('emacs')
makedepends=('emacs')
provides=('color-theme')
replaces=('color-theme')
install=$pkgname.install
source=(http://download.savannah.gnu.org/releases/color-theme/color-theme-$pkgver.tar.gz
        'gnus-bug.diff'
        'fix-build.patch')
md5sums=('a4de73c236a6af11ab378bfe18dabcca'
         '8b7ee1c4c6f80606f22c3de448ec92e8'
         '25b92ea246716689502ebe050322a60a')

prepare() {
  cd color-theme-$pkgver
  patch -p1 -i "$srcdir"/gnus-bug.diff
  patch -p0 -i "$srcdir"/fix-build.patch
}
  
build() {
  cd color-theme-$pkgver
  make
}

package() {
  cd color-theme-$pkgver
  install -Dm644 color-theme.el \
    "$pkgdir"/usr/share/emacs/site-lisp/color-theme.el
  install -Dm644 themes/color-theme-library.el \
    "$pkgdir"/usr/share/emacs/site-lisp/themes/color-theme-library.el
  install -Dm644 themes/color-theme-example.el \
    "$pkgdir"/usr/share/emacs/site-lisp/themes/color-theme-example.el
  install -Dm644 color-theme.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/color-theme.elc
  install -Dm644 themes/color-theme-library.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/themes/color-theme-library.elc
  install -Dm644 themes/color-theme-example.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/themes/color-theme-example.elc
}
