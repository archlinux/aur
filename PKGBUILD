# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf-git
pkgrel=1
pkgver=0.3.5.1.g878e31c
pkgdesc="PDF support for zathura by using the mupdf library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-pdf-mupdf"
license=('custom')
depends=('zathura-git' 'libmupdf>=1.9')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check')
conflicts=('zathura-pdf-mupdf')
provides=('zathura-pdf-mupdf')
source=('zathura-pdf-mupdf::git+https://git.pwmt.org/pwmt/zathura-pdf-mupdf.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-pdf-mupdf

prepare() {
  mkdir -p build
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release $srcdir/$_gitname
  ninja
}

check() {
  cd build
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

# vim:set ts=2 sw=2 et:
