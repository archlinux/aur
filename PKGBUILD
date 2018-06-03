# Maintainer: Michal Ulianko <michal (dot) ulianko (at) gmail (dot) com>

pkgname=coin-hg
pkgver=r11781.a8c6435095ce
pkgrel=1
pkgdesc="A high-level, retained-mode 3D graphics toolkit compatible with Open Inventor 2.1"
arch=('x86_64')
url="https://bitbucket.org/Coin3D/coin"
license=('BSD')
depends=('libgl')
makedepends=('mercurial' 'cmake' 'doxygen')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
source=('coin::hg+https://bitbucket.org/Coin3D/coin'
        'generalmsvcgeneration::hg+https://bitbucket.org/Coin3D/generalmsvcgeneration'
        'boost-header-libs-full::hg+https://bitbucket.org/Coin3D/boost-header-libs-full')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/coin"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$srcdir/coin"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    make
}

package() {
    cd "$srcdir/coin"
    make DESTDIR="$pkgdir/" install
}
