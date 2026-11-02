# Maintainer: taotieren <admin@taotieren.com>

pkgname=sch-rnd-svn
pkgver=r12509
pkgrel=1
pkgdesc="simple, modular, scriptable schematics editor"
url="http://www.repo.hu/projects/sch-rnd/"
arch=($CARCH)
license=('LGPL-2.0-or-later')
depends=(
  'sh'
  'librnd4'
  'libxml2'
)
optdepends=(
  'freetype2: import_ttf plugin'
  'fungw'
)
makedepends=('subversion')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
source=("svn://svn.repo.hu/sch-rnd/trunk")
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
