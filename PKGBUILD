# Maintainer: Johan Klokkhammer Helsing <johanhelsing@gmail.com>

pkgname=wayland-log-reader-git
pkgver=0.20191008.20.ed02317
pkgrel=1
pkgdesc="Application for navigating and making sense of WAYLAND_DEBUG log output"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/johanhelsing/wayland-log-reader'
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git' 'cmake')

_gitroot="git://github.com/johanhelsing/wayland-log-reader.git"
_gitbranch=master
_gitname=$pkgname
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo "0.$(git log -1 --format="%cd" --date=short | tr -d '-').$(git rev-list --count HEAD).$(git log -1 --format="%h")"
}

build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr "../${_gitname}"
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
