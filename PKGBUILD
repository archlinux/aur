# Maintainer: Tiziano Bacocco <tizbac2@gmail.com>

pkgname=kdevelop-go
pkgver=v5.2.1
pkgrel=1
pkgdesc="Go language plugin for kdevelop"
arch=('i686' 'x86_64')
url="https://cgit.kde.org/kdev-go.git"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevelop' 'go' 'kdevelop-pg-qt')
makedepends=('cmake' 'automoc4' 'git' 'go' 'extra-cmake-modules')
source=('git+git://anongit.kde.org/kdev-go')

md5sums=('SKIP')

prepare()
{
	cd "$srcdir/kdev-go"
	git checkout 8d48bb4145e40102f11b2876837ca7a182ef867a
}

build() {
    cd "$srcdir/kdev-go"

    mkdir -p "$srcdir/kdev-go/build"
    cd "$srcdir/kdev-go/build"

    cmake ../ \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "$srcdir/kdev-go/build"

    make DESTDIR="$pkgdir/" install
}
