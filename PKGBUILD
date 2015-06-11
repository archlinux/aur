# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=migemo-git
pkgver=1.9.1.r11.gc2240af
pkgrel=1
pkgdesc="Japanese incremental search with 'Romaji' on Emacsen (git version)"
arch=('any')
url="https://github.com/emacs-jp/migemo"
license=('GPL')
depends=('emacs>=24' 'cmigemo')
makedepends=('git')
provides=('migemo')
conflicts=('migemo')
install=migemo-git.install
source=(${pkgname%-git}::'git+https://github.com/emacs-jp/migemo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  sed -i -e 's!@pkgdatadir@!/usr/share/emacs/site-lisp!g' migemo.el
  emacs -q -batch -f batch-byte-compile migemo.el
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 migemo.el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 migemo.elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/${pkgname}
  install -c -m 644 README.md "$pkgdir"/usr/share/doc/${pkgname}
  install -d -m 755 "$pkgdir"/usr/share/doc/${pkgname}/images
  install -c -m 644 images/migemo.png "$pkgdir"/usr/share/doc/${pkgname}/images
}

# vim:set ts=2 sw=2 et:
