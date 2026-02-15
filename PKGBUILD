# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=libzathura

pkgname=libzathura-git
pkgver=25ef21e
pkgrel=2
pkgdesc="A document library."
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/libzathura"
license=('custom')
depends=('glib2>=2.28' 'intltool' 'file')
makedepends=('git' 'python-sphinx' 'python-sphinx_rtd_theme'
  'python-sphinx-hawkmoth' 'intltool' 'meson')
checkdepends=('check' 'libfiu')
conflicts=('libzathura')
provides=('libzathura')
source=("${_pkgname}::git+https://github.com/pwmt/libzathura.git#branch=develop")
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
