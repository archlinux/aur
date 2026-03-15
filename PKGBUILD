# Maintainer: b10n <b10n@dittes.nl>

pkgname=gtetrinet-gtk3-git
pkgver=0.7.11.r110.g6d816ee
pkgrel=1
pkgdesc="A fork of GTetrinet using GTK3"
url="https://github.com/tatankat/gtetrinet"
arch=("x86_64")
license=("GPL2")
depends=("gtk3")
makedepends=("git")
provides=("gtetrinet")
conflicts=("gtetrinet")
source=("git+https://github.com/tatankat/gtetrinet.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/gtetrinet"
  git describe --long | sed 's/GTETRINET_//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
  cd "${srcdir}/gtetrinet"
  patch -Np2 -i ../../dialog-patch.patch
}

build() {
  cd "${srcdir}/gtetrinet"
  ./autogen.sh --prefix=/usr
  make
}

check() {
  cd "${srcdir}/gtetrinet"
  make -k check
}

package () {
  cd "${srcdir}/gtetrinet"
  make DESTDIR="${pkgdir}" install
}
