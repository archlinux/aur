# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=numactl-git
pkgver=2.0.12.r6.gbad479d
pkgrel=1
pkgdesc="Simple NUMA policy support"
arch=('i686' 'x86_64')
url="https://github.com/numactl/numactl"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git')
provides=('numactl')
conflicts=('numactl')
options=('staticlibs')
source=("git+https://github.com/numactl/numactl.git")
sha256sums=('SKIP')


pkgver() {
  cd "numactl"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "numactl"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "numactl"

  #make check
}

package() {
  cd "numactl"

  make DESTDIR="$pkgdir" install

  # move_pages(2) is provided by man-pages and is more up-to-date there anyway
  rm -r "$pkgdir/usr/share/man/man2"
}
