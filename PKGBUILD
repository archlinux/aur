# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=kicad-templates-git
_pkgname=${pkgname%-*}
pkgver=ad2966f
pkgrel=1
pkgdesc="Official KiCad project templates"
arch=('any')
url="https://github.com/KiCad/kicad-templates"
license=('GPL')
makedepends=('cmake' 'git')
options=('!strip')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library')
source=("git://github.com/KiCad/kicad-templates.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${_pkgname} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
  rm ${pkgdir}/usr/share/kicad/template/*.kicad_wks
  rm ${pkgdir}/usr/share/kicad/template/kicad.pro
}
