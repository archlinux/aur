# Maintainer: aksr <aksr at t-com dot me>
pkgname=emacs-lyqi-mode-git
pkgver=r78.4876a0f
pkgrel=2
epoch=
pkgdesc="Emacs mode for LilyPond editing."
arch=('any')
url="https://github.com/nsceaux/nenuvar"
license=('GPLv3')
groups=()
depends=('emacs' 'lilypond')
makedepends=('git' 'wget')
optdepends=()
checkdepends=()
provides=()
conflicts=('emacs-lyqi-mode')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/nsceaux/lyqi.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make lyqi-help-index.el
  make lyqi-help-index.el
  make lyqi-words.el
  make lyqi.elc
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -m644 *.el $pkgdir/usr/share/emacs/site-lisp/
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 lilypond-index.html $pkgdir/usr/share/doc/$pkgname/lilypond-index.html
}

