# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=luawrapper-git
pkgver=r28.1bc122f
pkgrel=1
pkgdesc="luawrapper for C++"
license=('MIT')
arch=('i686' 'x86_64')
url="http://github.com/ekpyron/luawrapper/"
depends=('luajit')
makedepends=('git' 'cmake')
source=('git+git://github.com/ekpyron/luawrapper')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/luawrapper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf "$srcdir"/build
    mkdir -p "$srcdir"/build
    cd "$srcdir"/build
    cmake ../luawrapper/ -DLUA_INCLUDE_DIR=/usr/include/luajit-2.0 -DLUA_LIBRARY=/usr/lib/libluajit-5.1.so -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir"/build
    make DESTDIR="${pkgdir}" install
}
