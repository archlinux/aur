# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnetfilter_queue-git
pkgver=1.0.5.r50.g60aa427
pkgrel=1
pkgdesc="Library providing an API to packets that have been queued by the kernel packet filter"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnetfilter_queue/index.html"
license=('GPL-2.0-or-later')
depends=('libnfnetlink' 'libmnl')
makedepends=('git')
provides=("libnetfilter_queue=$pkgver")
conflicts=('libnetfilter_queue')
source=("git+https://git.netfilter.org/libnetfilter_queue")
sha256sums=('SKIP')


pkgver() {
  cd "libnetfilter_queue"

  git describe --long --tags | sed 's/^libnetfilter_queue-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnetfilter_queue"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libnetfilter_queue"

  make DESTDIR="$pkgdir" install
}
