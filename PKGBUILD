# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-ps-git
pkgrel=1
pkgver=0.2.0.7.g2a02c06
pkgdesc="PostScript support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-ps"
license=('custom')
depends=('zathura-git' 'libspectre')
makedepends=('git')
conflicts=('zathura-ps')
provides=('zathura-ps')
source=('zathura-ps::git+git://pwmt.org/zathura-ps.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-ps

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
