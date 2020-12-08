# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname='pavucontrol-qt'
pkgname="$_pkgname-sandsmark-git"
pkgver=0.3.0.320.gc1ac54e
pkgrel=1
pkgdesc="Improved version of pavucontrol, the standard pulseaudio volume control"
arch=('i686' 'x86_64')
url="https://github.com/sandsmark/$_pkgname"
license=('GPL2')
depends=('libpulse' 'qt5-base')
makedepends=('git' 'cmake')
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")
source=("git+https://github.com/sandsmark/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/-/./g"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd build
    make DESTDIR=$pkgdir install
}

# vim: ft=sh syn=sh ts=4 sw=4 expandtab
