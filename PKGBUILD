# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=gtk-gnutella-git
pkgver=1.1.9.r23.g76f8669
pkgrel=1
pkgdesc="Efficient Gnutella 2 client (latest git version)"
arch=('i686' 'x86_64')
url="http://gtk-gnutella.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=("${pkgname}::git://github.com/gtk-gnutella/gtk-gnutella.git" "${pkgname}.install")
md5sums=('SKIP' '0b6211b511da48346cecdc1d2f963c76')

pkgver() { 
  cd ${pkgbase} && git describe --tags | sed -e 's/^v\(.*\)-\([0-9]\+\)-\(g.*\)/\1.r\2.\3/'
}

prepare() {
  cd ${pkgbase}
  git submodule update --init
}

build() {
  cd ${pkgbase}
  ./build.sh --cc=gcc --prefix=/usr --cflags="-Os" --enable-halloc
}

package() {
  cd ${pkgbase}
  make install INSTALL_PREFIX="${pkgdir}/"
  strip -s ${pkgdir}/usr/bin/gtk-gnutella
}