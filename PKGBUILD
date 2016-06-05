# Contributor:
# Maintainer: 

pkgname=memwatch-git
pkgver=0.3.0.r9.ga3630f6
pkgrel=1
pkgdesc="Interactive memory viewer"
arch=('i686' 'x86_64')
url="https://bitbucket.org/PascalRD/memwatch"
license=('custom:WTFPL')
depends=('ncurses')
makedepends=('git' 'cmake')
source=("git+https://bitbucket.org/PascalRD/memwatch")
md5sums=('SKIP')
_gitname="memwatch"

pkgver() {
   cd "$srcdir"/"$_gitname"
   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/"$_gitname"

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    cd "$srcdir/$_gitname"
    cd build
    make DESTDIR="$pkgdir" install
    install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}