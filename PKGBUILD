# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=easyexif-git
pkgver=r34.a68a2cc
pkgrel=2
pkgdesc="Tiny ISO-compliant C++ EXIF parsing library, third-party dependency free."
arch=('i686' 'x86_64')
url="https://github.com/mayanklahiri/easyexif"
license=('BSD-2-Clause')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('easyexif')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("easyexif::git+https://github.com/mayanklahiri/easyexif.git")
noextract=()
md5sums=('SKIP')

build()
{
    cd easyexif

    sed -i -e "s/^\(CXXFLAGS.*\)/\1 -fPIC/" Makefile
    make
    ar rcs libeasyexif.a exif.o
}

package()
{
    cd easyexif

    mkdir -p $pkgdir/usr/lib
    cp libeasyexif.a $pkgdir/usr/lib

    mkdir -p $pkgdir/usr/include/easyexif
    cp exif.h $pkgdir/usr/include/easyexif/
}

pkgver()
{
  cd easyexif
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
