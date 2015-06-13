# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=iftop-devel
pkgver=0.99_1.0pre4
pkgrel=1
pkgdesc="iftop does for network usage what top(1) does for CPU usage - pre-1.0 release"
arch=('i686' 'x86_64')
url="http://www.ex-parrot.com/~pdw/iftop/"
license=('GPL')
depends=('libpcap>=1.0.0' 'ncurses')
provides=('iftop')
conflicts=('iftop' 'iftop-ipv6')
options=('!makeflags')
source=(http://www.ex-parrot.com/~pdw/iftop/download/iftop-1.0pre4.tar.gz)
md5sums=('7e6decb4958e8a4890cccac335239f24')
sha512sums=('abd74e8025bb82fef9ebab4997b1d018201a523d47c0128128ca37797490046538d74758dc4471735c22b890e5bd238ad6b2a30776d465138ede367cdd263d22')

prepare() {
  cd "$srcdir/iftop-1.0pre4"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --bindir=/usr/bin
}

build() {
  cd "$srcdir/iftop-1.0pre4"
  export CFLAGS="-DNO_SYSTEM -Wall -DUSE_GETNAMEINFO=1 -DUSE_GETIFADDRS=1 -g"
  export LDFLAGS="-Wl,-z,defs"
  make
}

package() {
  cd "$srcdir/iftop-1.0pre4"
  make DESTDIR="$pkgdir" install
}
