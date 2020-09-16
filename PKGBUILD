# Maintainer: Michal Ulianko <michal (dot) ulianko (at) gmail (dot) com>

gitname=coin
pkgname=${gitname}-git
pkgver=r12143.fd528f58e
pkgrel=1
pkgdesc="A high-level, retained-mode 3D graphics toolkit compatible with Open Inventor 2.1"
arch=('x86_64')
url="https://github.com/coin3d/$gitname"
license=('BSD')
depends=('glu')
makedepends=('git' 'cmake' 'doxygen' 'boost')
provides=(${gitname}{,-hg})
conflicts=(${gitname}{,-hg})
source=("git+${url}.git"
        'git+https://github.com/coin3d/generalmsvcgeneration.git'
        'git+https://github.com/coin3d/cpack.d.git'
        'git+https://github.com/coin3d/boost-header-libs-full.git')
md5sums=(SKIP SKIP SKIP SKIP)

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

build() {
    mkdir "$srcdir/build"
    cd "$srcdir/build"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
          ../coin
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
