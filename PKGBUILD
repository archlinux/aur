# Maintainer: Juanjo Gutiérrez <juanjo at gutierrezdequevedo dot com>
pkgname=cutelogger
_pkgnamebase=CuteLogger
pkgver=r92.5001249
pkgrel=1
pkgdesc="Simple, convenient and thread safe logger for Qt-based C++ apps"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dept2/CuteLogger"
license=('LGPL2.1')
provides=('cutelogger')
source=(git+https://github.com/dept2/CuteLogger)
sha1sums=('SKIP')
depends=('qt5-base')
makedepends=('git' 'cmake')

pkgver() {
  cd "$_pkgnamebase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir "$srcdir/$_pkgnamebase/build"
    cd "$srcdir/$_pkgnamebase/build"
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$_pkgnamebase/build"
    make install DESTDIR="$pkgdir"
    install -m755 -d "$pkgdir/usr/include/${_pkgnamebase}"
    install -m644 "$srcdir/$_pkgnamebase/include"/* "$pkgdir/usr/include/${_pkgnamebase}"
}
