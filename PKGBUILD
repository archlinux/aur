# Maintainer: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=auto-complete-nxml-git
pkgver=0.r27.aece0b9
pkgrel=2
pkgdesc="An extension of Emacs provides completion by auto-complete.el on nXML-mode"
arch=('any')
url="https://github.com/aki2o/auto-complete-nxml"
license=('GPL')
groups=()
depends=('emacs' 'emacs-auto-complete-git')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=auto-complete-nxml-git.install
source=('auto-complete-nxml::git+https://github.com/aki2o/auto-complete-nxml.git')
md5sums=('SKIP')

_gitname='auto-complete-nxml'
_elfile='auto-complete-nxml'

pkgver() {
  cd "$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  emacs -q -batch -f batch-byte-compile "$_elfile".el
}

package() {
  cd $_gitname
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 "$_elfile".el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 "$_elfile".elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/${pkgname}
  install -d -m 755 image "$pkgdir"/usr/share/doc/${pkgname}/image
  install -c -m 644 image/* "$pkgdir"/usr/share/doc/${pkgname}/image
  install -c -m 644 README.md "$pkgdir"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
