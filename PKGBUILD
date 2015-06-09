# Maintainer: Swift Geek
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-library-git
_pkgname=${pkgname%-*}
pkgver=a
pkgrel=1
pkgdesc="The schematic and 3D libraries supported by KiCad team"
arch=('any')
url="https://github.com/KiCad/kicad-library"
license=('GPL')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr')
source=("git://github.com/KiCad/kicad-library.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/${_pkgname}-build/Release"
  cd "$srcdir/${_pkgname}-build/Release"
  cmake ../../${_pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}-build/Release"

  make DESTDIR="$pkgdir" install

  # not libraries (and provided by kicad)
  rm -rf "$pkgdir/usr/share/kicad/template"
}
