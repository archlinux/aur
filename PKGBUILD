# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-epub-git
pkgrel=1
pkgver=4a2e037
pkgdesc="EPUB support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura"
license=('custom')
depends=('zathura>=0.2.0' 'calibre')
makedepends=('git')
conflicts=('zathura-epub')
provides=('zathura-epub')
source=('zathura-epub::git+git://pwmt.org/zathura-epub.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-epub

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --long --always)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
