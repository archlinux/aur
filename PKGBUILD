# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname="thea-git"
pkgver=v0.0.0.r0.g901f7ea
pkgrel=1
epoch="1"
pkgdesc="A simple backup tool for desktop computers"
arch=("any")
url="https://github.com/plp13/thea"
license=("BSD")
depends=("rsnapshot" "zsh" "yad" "sudo" "gksu" "colordiff")
makedepends=("make")
provides=("thea")
conflicts=("thea")
install="config.install"
source=("git+https://github.com/plp13/thea")
sha256sums=("SKIP")

pkgver() {
  cd "thea"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "thea"
  sed -e 's/\/usr\/local/\/usr/g' -i Makefile thea-*
  sed -e 's/\/sbin/\/bin/g' -i Makefile
}

package() {
  cd "thea"
  make PREFIX="${pkgdir}/usr" install
  mv "${pkgdir}/usr/share/thea/config" "${pkgdir}/usr/share/thea/config.dist"
}
