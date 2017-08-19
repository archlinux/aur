# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnet-git
pkgver=1.2.rc3.r7.gbda4288
pkgrel=2
pkgdesc="A portable framework for low-level network packet construction"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/libnet-dev/"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('libnet')
conflicts=('libnet')
options=('staticlibs')
source=("git+https://github.com/sam-github/libnet.git")
sha256sums=('SKIP')


prepare() {
  cd "libnet/libnet"

  sed -i -e "s/doc //" "Makefile.am"
}

pkgver() {
  cd "libnet"

  git describe --long --tags | sed 's/^libnet-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnet/libnet"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libnet/libnet"

  make DESTDIR="$pkgdir" install
  install -Dm644 "doc/COPYING" "$pkgdir/usr/share/licenses/libnet/COPYING"
}
