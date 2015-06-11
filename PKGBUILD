# Maintainer: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=emacs-rnc-mode-git
pkgver=1.0.6.0.gb39dc23
pkgrel=3
pkgdesc="An Emacs major mode for editing XML schemas in RELAX-NG Compact syntax"
arch=('any')
url="https://github.com/TreeRex/rnc-mode"
license=('BSD')
groups=()
depends=('emacs')
makedepends=('git')
optdepends=('jing: On-the-fly syntax checking of your schema')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=emacs-rnc-mode-git.install
source=('rnc-mode::git+https://github.com/TreeRex/rnc-mode.git')
md5sums=('SKIP')

_gitname='rnc-mode'

pkgver() {
  cd $_gitname
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
  cd $_gitname
  emacs -q -batch -f batch-byte-compile ${_gitname}.el
}

package() {
  cd $_gitname
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 ${_gitname}.el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 ${_gitname}.elc "$pkgdir"/usr/share/emacs/site-lisp

  install -d -m 755 "$pkgdir"/usr/share/doc/${pkgname}
  install -c -m 644 README.md "$pkgdir"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
