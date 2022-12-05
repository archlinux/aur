# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=polkit-qt6
pkgname=$_pkgname-git
pkgver=v0.114.0.r13.g590e710
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
arch=('i686' 'x86_64')
url='https://invent.kde.org/libraries/polkit-qt-1'
license=('LGPL')
depends=('polkit' 'qt6-base')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://invent.kde.org/libraries/polkit-qt-1.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir/build"
    cmake "$srcdir/$_pkgname" \
      -DCMAKE_BUILD_TYPE=Release \
      -DQT_MAJOR_VERSION=6 \
      -DCMAKE_INSTALL_PREFIX=/opt/KF5-qt6/
     make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="${pkgdir}" install
}
