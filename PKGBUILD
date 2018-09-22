# Maintainer: tomKPZ <tomKPZ@gmail.com>
# Maintainer Original Package: Roger Duran <rogerduran@gmail.com>
# Maintainer Original Original Package: Conley Moorhous <conleymoorhous@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Thomas Jost <schnouki@schnouki.net>

pkgname=xtrace
pkgver=1.3.1
pkgrel=1
pkgdesc="trace communication between X client and server"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('autoconf' 'make')
optdepends=('xorg-xauth')
source=("https://alioth-archive.debian.org/releases/xtrace/xtrace/1.3.1/xtrace_${pkgver}.orig.tar.gz")
sha256sums=('b22ca970efe24fcedff44f38075c5f34e0893f66abb419f3180ff92adf9e2a22')

build() {
  cd "$srcdir/xtrace-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/xtrace-${pkgver}"
  make check
}

package() {
  cd "$srcdir/xtrace-${pkgver}"

  make DESTDIR="$pkgdir" install

  # Rename executable to x11trace since glibc owns xtrace
  mv "$pkgdir/usr/bin/xtrace" "$pkgdir/usr/bin/x11trace"
  # Rename man page to x11trace since glibc owns xtrace
  mv "$pkgdir/usr/share/man/man1/xtrace.1" "$pkgdir/usr/share/man/man1/x11trace.1"
}
