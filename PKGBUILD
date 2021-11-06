# Maintainer: Vianney le Clément <code@quartic.eu>
_pkgname=pplatex
pkgname=$_pkgname-git
pkgver=20210523.gba8191a
pkgrel=1
pkgdesc="Pretty-Print LaTeX: A tool to reformat the output of latex and friends into readable messages"
arch=('i686' 'x86_64')
url="https://github.com/stefanhepp/pplatex"
license=('GPL3')
depends=('pcre' 'texlive-bin')
makedepends=('git' 'cmake')
source=("git+https://github.com/stefanhepp/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

build() {
  mkdir build
  cd build
  cmake "$srcdir/$_pkgname"
  cmake --build .
}

package() {
  install -Dm755 "$srcdir/build/src/pplatex" "$pkgdir/usr/bin/pplatex"
  ln -s pplatex "$pkgdir/usr/bin/ppdflatex"
  install -Dm755 "$srcdir/$_pkgname/src/ppluatex" "$pkgdir/usr/bin/ppluatex"
}

# vim:set ts=2 sw=2 et:
