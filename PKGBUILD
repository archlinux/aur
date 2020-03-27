# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-ps-git
pkgrel=1
pkgver=0.2.6.7.g8796664
pkgdesc="PostScript support for zathura"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/zathura-ps"
license=('custom')
depends=('zathura-git' 'libspectre')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check')
conflicts=('zathura-ps')
provides=('zathura-ps')
source=('zathura-ps::git+https://git.pwmt.org/pwmt/zathura-ps.git#branch=develop')
md5sums=('SKIP')
_gitname=zathura-ps

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
