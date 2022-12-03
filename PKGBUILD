# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Daniel Funke <mr.daniel.funke@gmail.com>

pkgname=libejdb-git
pkgver=v2.73.r14.gd5668186
pkgrel=1
pkgdesc="Embedded JSON Database engine"
arch=('i686' 'x86_64')
url="http://ejdb.org"
license=('LGPL')
depends=()
makedepends=('cmake')
conflicts=('libejdb')
provides=('libejdb')
source=('ejdb::git+https://github.com/Softmotions/ejdb')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ejdb"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/ejdb"

    mkdir -p build && cd build
    cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SAMPLES=OFF \
        -DPACKAGE_TGZ=OFF \
        ..

    make
}

package() {
    cd "${srcdir}/ejdb/build"

    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
