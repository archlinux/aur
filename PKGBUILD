# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=doxygen-git
pkgver=1.14.0.r361.ge7e0dac1
pkgrel=1
pkgdesc="A documentation system for C++, C, Java, IDL and PHP - git version"
arch=('i686' 'x86_64')
url="http://www.doxygen.org"
license=('GPL2')
# Qt required for doxywizard - prefer Qt6
depends=('qt6-base' 'xapian-core')
makedepends=('git' 'cmake' 'perl' 'flex' 'bison' 'python')
optdepends=('graphviz: enable dot support')
conflicts=('doxygen')
provides=('doxygen')
replaces=('doxygen-svn')
source=("$pkgname"::'git+https://github.com/doxygen/doxygen.git')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=8 | sed 's/^Release_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
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
