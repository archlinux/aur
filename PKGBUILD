# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnl-git
pkgver=3.4.0.r70.g9e34b5d
pkgrel=1
pkgdesc="A collection of libraries providing APIs to netlink protocol based Linux kernel interfaces"
arch=('i686' 'x86_64')
url="https://www.infradead.org/~tgr/libnl/"
license=('LGPL2')
depends=('glibc')
makedepends=('git')
provides=('libnl')
conflicts=('libnl')
backup=('etc/libnl/classid' 'etc/libnl/pktloc')
options=('staticlibs')
source=("git+https://github.com/thom311/libnl.git")
sha256sums=('SKIP')


pkgver() {
  cd "libnl"

  git describe --long --tags | sed 's/^libnl//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "libnl"

  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc"
  make
}

check() {
  cd "libnl"

  make check
}

package() {
  cd "libnl"

  make DESTDIR="$pkgdir" install
}
