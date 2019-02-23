# Maintainer: Vianney le Clément <vleclement AT gmail·com>
_pkgname=pplatex
pkgname=$_pkgname-git
pkgver=20150915.g5cec891
pkgrel=2
pkgdesc="Pretty-Print LaTeX: A tool to reformat the output of latex and friends into readable messages"
arch=('i686' 'x86_64')
url="https://github.com/stefanhepp/pplatex"
license=('GPL3')
depends=('pcre' 'texlive-bin')
makedepends=('git' 'scons')
source=("git+https://github.com/stefanhepp/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

build() {
  cd "$srcdir/$_pkgname"
  scons
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bin/pplatex "$pkgdir/usr/bin/pplatex"
  ln -s pplatex "$pkgdir/usr/bin/ppdflatex"
  install -Dm755 bin/ppluatex "$pkgdir/usr/bin/ppluatex"
}

# vim:set ts=2 sw=2 et:
