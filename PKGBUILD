# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=loggedfs
pkgname=$_pkgname-git
pkgver=0.9.r1.gd1fcf7a
pkgrel=1
pkgdesc="Filesystem monitoring with Fuse"
arch=('i686' 'x86_64')
url="https://rflament.github.io/loggedfs/"
license=('Apache')
depends=('fuse3')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/rflament/loggedfs.git"
        "0001-Remove-absolute-paths-make-non-interactive.patch")
sha256sums=('SKIP'
            'ddf9dab7f60b08eb9606563158b9d538b8d8b79f78cd5e4c9e0498139d37c44c')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/loggedfs.//g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 < ../0001-Remove-absolute-paths-make-non-interactive.patch
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}

