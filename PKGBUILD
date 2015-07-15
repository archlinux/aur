
_name=libgames-support
pkgname=$_name-git
pkgver=0.1.r166.f8ada8e
pkgrel=1
pkgdesc="Code shared between GNOME games"
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/libgames-support"
license=('GPL')
depends=('clutter-gtk' 'libgee')
makedepends=('vala' 'gnome-common' 'git')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=(git+https://git.gnome.org/browse/$_name)
md5sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep AC_INIT configure.ac | cut -d[ -f3 | cut -d] -f1)
  printf "%s.r%s.%s" $v $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd $_name
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd $_name
  make DESTDIR="$pkgdir" install
}
