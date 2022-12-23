#Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
#Contributor: Maël Leclair <mael.leclair@gmail.com>
pkgname=grisbi-git
_pkgname=grisbi
pkgver=2.9.90.r142.g3c9f1d8a8
pkgrel=1
epoch=1
pkgdesc="Personal financial management program - Development version"
arch=('x86_64')
url="https://www.grisbi.org"
license=('GPL')
depends=('gtk3' 'openssl-1.1')
optdepends=('libofx: for OFX support')
makedepends=('git' 'intltool' 'libgsf')
provides=('grisbi')
conflicts=('grisbi')
replaces=('grisbi')
source=("$pkgname"::'git+https://github.com/grisbi/grisbi.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/upstream_version_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
