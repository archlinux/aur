# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=jumanji-git
pkgver=r464.f8e04e5
pkgrel=1
pkgdesc="a web browser"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/jumanji"
license=('custom')
depends=('girara' 'webkitgtk' 'libsoup>=2.36.1' 'sqlite3')
makedepends=('git')
conflicts=('jumanji')
provides=('jumanji')
source=('jumanji::git+git://pwmt.org/jumanji.git#branch=develop')
md5sums=('SKIP')
_repo=jumanji

build() {
  cd "$srcdir/$_repo"

  CFLAGS+=" -O0" make
}

package() {
  cd "$srcdir/$_repo"

  make DESTDIR="$pkgdir/" install
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
