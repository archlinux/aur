# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=libzathura

pkgname=libzathura-git
pkgver=69efc7d
pkgrel=1
pkgdesc="A document library."
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/libzathura"
license=('custom')
depends=('glib2>=2.28' 'intltool' 'file')
makedepends=('git' 'python-sphinx' 'intltool' 'meson')
checkdepends=('check' 'libfiu')
conflicts=('libzathura')
provides=('libzathura')
source=("${_pkgname}::git+https://git.pwmt.org/pwmt/libzathura.git#branch=develop")
md5sums=('SKIP')
_gitname=libzathura

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
  git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
