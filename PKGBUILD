# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Maintainer Original Package: Conley Moorhous <conleymoorhous@gmail.com>
# Maintainer: Roger Duran <rogerduran@gmail.com>

pkgname=xtrace-git
pkgver=210.0ab52b0
pkgrel=1
pkgdesc="Xtrace fakes an X server and forwards all connections to a real X server, displaying the communication between the clients and the server in a human readable form"
arch=('i686' 'x86_64')
license=('GPL')
url="http://xtrace.alioth.debian.org/"
depends=('glibc')
source=('git://git.debian.org/xtrace/xtrace.git')
_gitname='xtrace'
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_gitname"
  make check
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install

  # Rename executable to x11trace since glibc owns xtrace
  mv "$pkgdir/usr/bin/xtrace" "$pkgdir/usr/bin/x11trace"
  # Rename man page to x11trace since glibc owns xtrace
  mv "$pkgdir/usr/share/man/man1/xtrace.1" "$pkgdir/usr/share/man/man1/x11trace.1"
}
