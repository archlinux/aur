# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>
# Contributor: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=emacs-navi2ch-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#emacs-}
pkgver=r34.922dbd3
pkgrel=1
pkgdesc="Navigator for 2ch for Emacsen (HTTPS enabled)"
arch=('any')
url='https://repo.or.cz/navi2ch.git'
license=('GPL-2.0-or-later')
depends=('emacs')
makedepends=('git' 'meson' 'ninja')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url#branch=current")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  meson setup builddir
  meson compile -C builddir
}

package(){
  cd "$_pkgname"/builddir
  install -Dm644 -t "$pkgdir"/usr/share/emacs/site-lisp/navi2ch/ *.el{c,}
  install -Dm644 -t "$pkgdir"/usr/share/info/ navi2ch.info
}
