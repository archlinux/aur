# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_log-git
pkgver=1.0.1.r17.gba196a9
pkgrel=1
pkgdesc="Userspace library providing interface to packets that have been logged by the kernel packet filter"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_log/index.html"
license=('GPL')
depends=('libnfnetlink' 'libmnl')
makedepends=('git')
provides=('libnetfilter_log')
conflicts=('libnetfilter_log')
source=("git://git.netfilter.org/libnetfilter_log")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_log"

  git describe --long --tags | sed 's/^libnetfilter_log-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_log"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_log"

  make DESTDIR="$pkgdir" install
}
