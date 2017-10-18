# Maintainer: Jakub Fišer <kubaCURLYSYMBOLufiseruSMALLPOINTSYMBOlcz>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=vit-git
pkgver=r175.d72d6e0
pkgrel=1
pkgdesc="A terminal interface for Taskwarrior with Vim key bindings and colorization support. GIT version."
arch=('any')
url="https://github.com/scottkosty/vit"
license=('GPL3')
depends=('perl-try-tiny' 'perl-curses' 'perl-text-charwidth' 'task')
makedepends=( 'git' )
source=(git+https://github.com/scottkosty/vit.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}

  # allow custom perl location
  sed -ri "s|(#!/usr/bin/)perl -w|\1env perl|" vit.pl
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
