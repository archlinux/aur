# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Andrew Whatson <whatson@gmail.com>

_pkgname=shroud
pkgname=${_pkgname}-git
pkgver=0.1.2.r2.gce77970
pkgrel=2
pkgdesc='A simple command-line secret manager using GNU Guile'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile2.0' 'gnupg' 'xclip')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
url="https://dthompson.us/projects/shroud.html"
source=("git+https://git.dthompson.us/shroud.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  ./bootstrap
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
