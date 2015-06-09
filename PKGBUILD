# Maintainer: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=v0.9.11.97.g646b065
pkgrel=2
pkgdesc="mu and mu4e from git"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
depends=(xapian-core gmime sqlite3)
makedepends=(git libtool)
optdepends=('guile: guile support',
            'emacs: mu4e support')
license=('GPL')
provides=('mu')
conflicts=('mu')

source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')
pkgver() {
  cd mu
  printf "%s" "$(git describe --tags|sed 's+-+.+g')"
}

build() {
  cd mu
  autoreconf -i
  sed -i 's|MUGDIR|"/usr/share/pixmaps"|' toys/mug/mug.c
  ./configure --prefix=/usr --disable-webkit --disable-gtk
}

package() {
  cd mu
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/mu/COPYING
}
