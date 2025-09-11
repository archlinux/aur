#Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
#Contributor: Maël Leclair <mael.leclair@gmail.com>
pkgname=grisbi-git
_pkgname=grisbi
pkgver=3.1.0.r292.gbd2b3f1bd
pkgrel=1
epoch=1
pkgdesc="Personal financial management program - Development version"
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'openssl' 'goffice' 'libofx')
optdepends=('libofx: for OFX support')
makedepends=('git' 'intltool' 'libgsf' 'meson')
conflicts=('grisbi')
source=("$pkgname"::'git+https://github.com/grisbi/grisbi.git')
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/upstream_version_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "$pkgname"
  rm -rf build
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$pkgname"
  DESTDIR="${pkgdir}" meson install -C build
}
