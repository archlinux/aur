# Maintainer: taotieren <admin@taotieren.com>
# Contributor: CuVoodoo <pcb-rnd@cuvoodoo.info>
# Contributor: Kyle Keen <keenerd@gmail.com?>

pkgname=pcb-rnd-svn
pkgver=r40562
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=($CARCH)
license=('LGPL-2.0-or-later')
depends=(
  'sh'
  'librnd4' 
  'libxml2'
)
optdepends=(
  'gd: gd based exports and pixmap imports (png, gif, jpeg)'
  'freetype2: import_ttf plugin'
  'fungw'
)
makedepends=('subversion')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
source=("svn://svn.repo.hu/pcb-rnd/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/trunk/"
  make DESTDIR="$pkgdir/" install
}
