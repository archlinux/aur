# Maintainer: HMK
pkgname=gtk-gnutella-git
pkgver=1.3.1.r2.g3ce50bf0d
pkgrel=1
pkgdesc="Efficient Gnutella 2 client (latest git version)"
arch=("i686" "x86_64")
url="http://gtk-gnutella.sourceforge.net/"
license=("GPL-2.0-or-later")
depends=("gtk2" "desktop-file-utils")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("gtk-gnutella")
backup=()
options=("strip")
install="${pkgname}.install"
source=("${pkgname}.install" "${pkgname}::git+https://github.com/gtk-gnutella/gtk-gnutella.git#branch=devel")
md5sums=("0b6211b511da48346cecdc1d2f963c76" "SKIP")

pkgver() {
  cd ${pkgname}
  git describe --long | sed -e 's/^v\(.*\)-\([0-9]\+\)-\(g.*\)/\1.r\2.\3/'
}

build() {
  cd ${pkgname}
  export CFLAGS="${CFLAGS} -std=gnu17"
  ./build.sh --cc=gcc --prefix=/usr
}

package() {
  cd ${pkgname}
  make install INSTALL_PREFIX="${pkgdir}/"
  strip -s ${pkgdir}/usr/bin/gtk-gnutella
}
