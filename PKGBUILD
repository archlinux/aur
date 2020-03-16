#Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
#Contributor: Maël Leclair <mael.leclair@gmail.com>
pkgname=grisbi-git
_pkgname=grisbi
pkgver=1.9.1.r101.gfa136eacf
pkgrel=1
pkgdesc="Personal financial management program"
arch=('any')
url="http://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'libgsf')
optdepends=('libofx: for OFX support')
makedepends=('git' 'intltool')
provides=('grisbi')
conflicts=('grisbi')
replaces=('grisbi')
source=(git://github.com/grisbi/grisbi.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/upstream_version_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}


build() {
  
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
