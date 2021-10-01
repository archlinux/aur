# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=pnputils-git
pkgver=a
pkgrel=1
pkgdesc="PNP utils"
arch=('i686' 'x86_64')
url='http://git.debian.org/?p=collab-maint/pnputils.git'
license=('GPL')
makedepends=('git')
source=('git+https://gitlab.com/swiftgeek/pnputils.git')
md5sums=('SKIP')
conflicts=('pnputils')
provides=("pnputils=${pkgver%+*}")

pkgver() {
  cd "$srcdir/pnputils"
  git describe --long --tags | sed 's#.*/##; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/pnputils"
  make
}

package() {
  cd "$srcdir/pnputils"
  DESTDIR="$pkgdir" make install prefix=/usr sbindir=/usr/bin
}
