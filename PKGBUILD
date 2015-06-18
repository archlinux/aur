# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=wavemon-git
pkgver=0.7.6.217.b951f62
pkgrel=1
pkgdesc='Ncurses-based monitoring application for wireless network devices'
url='http://eden-feed.erg.abdn.ac.uk/wavemon/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ncurses' 'libcap')
makedepends=('git')
provides=('wavemon')
conflicts=('wavemon')
source=(${pkgname}::git+https://github.com/uoaerg/wavemon)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e 's|CFLAGS="$CFLAGS -pthread"||g' -i configure.ac
  sed -r 's|(/share)|\1/doc|g' -i Makefile.in
  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
