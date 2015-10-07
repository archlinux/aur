# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-bs2b
_gitname=bs2b
pkgver=8.cc336f1
pkgrel=1
pkgdesc="bs2b plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://github.com/Alexey-Yakovenko/bs2b"
license=('GPL2')
depends=('deadbeef' 'libbs2b')
source=('git+https://github.com/Alexey-Yakovenko/bs2b.git' 'bs2b.diff')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
        cd "$srcdir/$_gitname"
        patch -p1 < ../bs2b.diff
}

build() {
  cd "${srcdir}/bs2b"
  make
}

package() {
  cd "${srcdir}/bs2b"

  install -Dm 755 ddb_bs2b.so "$pkgdir/usr/lib/deadbeef/ddb_bs2b.so"
}
