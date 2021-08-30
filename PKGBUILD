# Maintainer: EndlessEden <eden [at] rose.place>
# Maintainer: Juri Grabowski <arch-dablin-maint@jugra.de>
_pkgname=dablin
pkgname=dablin
pkgver=1.13.0.r364.c20b4c6
pkgrel=1
pkgdesc="plays a DAB/DAB+ audio service – either from a received live transmission or from ETI files."
arch=('x86_64')
url="https://github.com/Opendigitalradio/dablin"
license=('GPL')
depends=('sdl2' 'mpg123' 'gtkmm3' 'faad2' 'fdkaac' 'libfdk-aac')
makedepends=('pkg-config' 'git' 'cmake')
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=($_pkgname::git+"$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$_pkgname"
   
    echo "$(git describe| sed 's,-,\n,g' | head -1 | sed 's,v,,g')"'.'$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
  cd "$srcdir"/"$_pkgname"

  if [ -d "$srcdir"/"$_pkgname"/build ]; then
  rm -rf "$srcdir"/"$_pkgname"/build
  fi

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd "$srcdir"/"$_pkgname"/build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
