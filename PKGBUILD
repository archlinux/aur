# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gleidson <gleidson.echeli@gmail.com>

pkgname=emacs-haskell-mode-git
pkgver=17.5.r14.g727f72a
pkgrel=1
pkgdesc="Haskell mode package for Emacs"
arch=(any)
license=('GPL-3.0-or-later')
url="https://github.com/haskell/haskell-mode"
install="${pkgname}.install"
makedepends=('emacs' 'git')
provides=('emacs-haskell-mode')
conflicts=('emacs-haskell-mode')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${pkgname}"
  export EMACS=/usr/bin/emacs
  make
}

package() {
  cd "${pkgname}"

  install -dm0755 "$pkgdir"/usr/share/emacs/site-lisp/haskell-mode
  install -m0644 *.el -t "$pkgdir"/usr/share/emacs/site-lisp/haskell-mode
  cp -a build-$(emacs --version | head -n1 | cut -f3 -d' ') -t "$pkgdir"/usr/share/emacs/site-lisp/haskell-mode/

  install -dm0755 "$pkgdir"/usr/share/doc/$pkgname
  install -m0644 NEWS README.md "$pkgdir"/usr/share/doc/$pkgname

  install -Dm0644 haskell-mode.info "$pkgdir"/usr/share/info/haskell-mode.info
}
