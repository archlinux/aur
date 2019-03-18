# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=doxygen-git
pkgver=Release_1_8_15.252.g3670a151
pkgrel=1
pkgdesc="A documentation system for C++, C, Java, IDL and PHP - git version"
arch=('i686' 'x86_64')
url="http://www.doxygen.org"
license=('GPL2')
# Qt5 required for doxywizard
depends=('qt5-base' 'xapian-core')
makedepends=('git' 'cmake' 'perl' 'flex' 'bison' 'python2')
optdepends=('graphviz: enable dot support')
conflicts=('doxygen')
provides=('doxygen')
replaces=('doxygen-svn')
source=("$pkgname"::'git+https://github.com/doxygen/doxygen.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Use the tag of the last commit
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

build() {
    mkdir -p "build"
    cd "build"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -Dbuild_wizard=YES \
        -Dbuild_search=YES \
        "../$pkgname"
    make
}

package() {
    cd "build"
    make DESTDIR="$pkgdir/" install
}
