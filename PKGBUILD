# Maintainer: Fenrihr <fmvm483@gmail.com>

pkgname=moneymanagerex-1.3.4-branch
_gitname=moneymanagerex
pkgver=1.3.4.rc.3.r5.f314bb58
pkgrel=1
pkgdesc="An easy-to-use personal finance suite."
arch=('i686' 'x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
#depends=('wxgtk3' 'webkit2gtk' 'rapidjson' 'lua')
depends=('wxgtk3' 'lua' 'rapidjson')
makedepends=('cmake' 'git' 'boost' 'gettext' 'lsb-release' )
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git#branch=v1.3.4)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/$_gitname"
    mkdir -p "build"
    git submodule update --init
}

build() {
    cd "$srcdir/$_gitname/build"
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build . --target package
}

package() {
    cd "$srcdir/$_gitname/build"

    make DESTDIR="${pkgdir}/" install
}
 
