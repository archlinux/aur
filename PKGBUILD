# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chromaryu <knight.ryu12@gmail.com>

pkgname=libxmp-git
pkgver=4.5.0.r758.g2e008819
pkgrel=2
pkgdesc="Library that supports over 90 module formats (Amiga, Atari, ..)"
arch=(x86_64 aarch64)
url="https://xmp.sourceforge.net/"
license=(LGPL2.1)
depends=(glibc)
makedepends=(git)
conflicts=(libxmp)
provides=(libxmp)
options=(!emptydirs)
source=("git+https://github.com/cmatsuoka/libxmp.git")
sha256sums=('SKIP')

pkgver() {
  cd libxmp
  git describe --long --tags | sed 's/^libxmp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libxmp
  autoconf
}

build() {
  cd libxmp
  ./configure --prefix=/usr
  make
}

check() {
  cd libxmp
  make -k check
}

package() {
  cd libxmp
  make DESTDIR="${pkgdir}" install
}
