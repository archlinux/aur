# Maintainer: Jack Random, <jack(at)random(dot)to>
# previous: csllbr; Popsch <popsch@gmx.net>
# Thanks to the maintainers and contributors of the mu binary package

pkgname=mu-git
pkgver=1.0.158.g508d3d4a
pkgrel=1
pkgdesc="mu and mu4e from git"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
depends=('xapian-core' 'guile' 'gmime3' 'json-glib')
makedepends=('git')
optdepends=('emacs: mu4e support')
license=('GPL')
provides=('mu')
conflicts=('mu')
source=('git+https://github.com/djcb/mu.git')
md5sums=('SKIP')

pkgver() {
  cd mu
  printf "%s" "$(git describe --tags|tr - .|cut -c2-)"
}

build() {
  cd mu
  autoreconf -i
  sed -i 's|MUGDIR|"/usr/share/pixmaps"|' toys/mug/mug.c
  ./configure --prefix=/usr --disable-webkit --disable-gtk --enable-mu4e
}

package() {
  cd mu
  make DESTDIR="$pkgdir" install
}
