# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-djvu-git
pkgrel=1
pkgver=0.2.2.3.gf64f3ff
pkgdesc="DjVu support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura/plugins/zathura-djvu"
license=('custom')
depends=('zathura-git' 'djvulibre')
makedepends=('git')
conflicts=('zathura-djvu')
provides=('zathura-djvu')
source=('zathura-djvu::git+git://pwmt.org/zathura-djvu.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-djvu

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
