# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-poppler-git
pkgrel=1
pkgver=0.3.0.1.gbc6e1ca
pkgdesc="PDF support for zathura by using the poppler rendering library"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-pdf-poppler"
license=('custom')
depends=('zathura-git' 'poppler-glib')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check')
conflicts=('zathura-pdf-mupdf' 'zathura-pdf-mupdf-git' 'zathura-pdf-poppler')
provides=('zathura-pdf-poppler-git' 'zathura-pdf-poppler')
source=('zathura-pdf-poppler::git+https://git.pwmt.org/pwmt/zathura-pdf-poppler.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-pdf-poppler

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
