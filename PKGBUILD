# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libnfnetlink-git
pkgver=1.0.2.r1.g5fec628
pkgrel=2
pkgdesc="Low-level library for netfilter related kernel/userspace communication"
arch=('i686' 'x86_64')
url="https://netfilter.org/projects/libnfnetlink/index.html"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("libnfnetlink=$pkgver")
conflicts=('libnfnetlink')
source=("git+https://git.netfilter.org/libnfnetlink")
sha256sums=('SKIP')


pkgver() {
  cd "libnfnetlink"

  git describe --long --tags | sed 's/^libnfnetlink-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libnfnetlink"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "libnfnetlink"

  make DESTDIR="$pkgdir" install
}
