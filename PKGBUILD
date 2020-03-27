# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-djvu-git
pkgrel=1
pkgver=0.2.9.2.g12ef085
pkgdesc="DjVu support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura/plugins/zathura-djvu"
license=('custom')
depends=('zathura-git' 'djvulibre')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check')
conflicts=('zathura-djvu')
provides=('zathura-djvu')
source=('zathura-djvu::git+https://git.pwmt.org/pwmt/zathura-djvu.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-djvu

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
