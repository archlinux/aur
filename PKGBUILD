# Contributor: Andreas Baumann <mail at andreas baumann dot cc>

pkgname=emu86-git
pkgver=r197.429971f
pkgrel=1
pkgdesc="Intel IA16 emulator for embedded development"
arch=('i686' 'x86_64')
url="https://github.com/mfld-fr/emu86"
depends=()
makedepends=('git')
source=("git+https://github.com/mfld-fr/emu86.git" "makefile-destdir-install.patch")
sha256sums=('SKIP' '9a20c1ad58fcb26228d03a878f3fc602ac6c66c59714968436363bd0880dc6e3')
_pkgname=emu86

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -Np1 -i "$srcdir/makefile-destdir-install.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr all
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR=$pkgdir install
}

