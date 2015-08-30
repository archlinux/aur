# $Id$
# Maintainer: Yue Liu <yue.liu@mail.com>

pkgname=libmathview-git
_gitname=libmathview
pkgver=r1278.a007fd2
pkgrel=1
pkgdesc="A library for rendering MathML documents"
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/libmathview"
license=('LGPL3')
conflicts=('libmathview')
provides=('libmathview')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'pkg-config' 'python2-lxml')
depends=('harfbuzz' 'libxml2' 'cairo' 'qt5-base' 'gtk2')
source=("git://github.com/khaledhosny/libmathview.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --enable-cairo=yes \
    --enable-qt=yes \
    --enable-gtk=yes \
    --enable-libxml2=yes \
    --enable-custom-reader=no \
    --enable-libxml2-reader=no

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=${pkgdir}/ install
}

