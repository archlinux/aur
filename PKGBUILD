# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=circa-git
pkgver=r4794.425b4a304
pkgrel=1
pkgdesc='Programming language designed for live coding'
arch=('x86_64' 'i686')
url='https://github.com/andyfischer/circa'
license=('MIT')
makedepends=('make')
sha256sums=('SKIP')
source=('git+https://github.com/andyfischer/circa.git')
_gitname='circa'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  LDFLAGS='-ldl' make config=release PREFIX=/usr
}

package() {
  cd "$_gitname"

  install -Dm755 build/"$_gitname" "$pkgdir/usr/bin/$_gitname"
  install -d "$pkgdir/usr/share/doc/$_gitname/"
  cp -r docs/* "$pkgdir/usr/share/doc/$_gitname/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_gitname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
