# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe <ndowens.aur at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=amberfish-git
pkgver=2.2.0.8
pkgrel=1
pkgdesc="A general purpose text retrieval software"
arch=('i686' 'x86_64')
url="https://github.com/nassibnassar/amberfish.git"
license=('GPL2')
depends=('xerces-c')
makedepends=('git')
source=("git+https://github.com/nassibnassar/amberfish.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf %s.%s $(git describe --tags|tr -d v) $(git rev-list --count HEAD)
}

build() {
  cd ${pkgname%-git}
  CXXFLAGS+="-std=c++11" ${FLAGS} ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              LDFLAGS=''
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install
}
