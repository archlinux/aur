# Maintainer: tleydxdy <shironeko@waifu.club>
pkgname=gnu-poke-git
pkgver=r3085.bb2998d4
pkgrel=1
pkgdesc="Interactive, extensible editor for binary data."
arch=('any')
url="http://www.jemarch.net/poke.html"
license=('GPL3')
depends=('gc' 'readline')
makedepends=('help2man' )
checkdepends=()
optdepends=()
provides=('poke')
source=("${pkgname}::git+https://git.savannah.gnu.org/git/poke.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    ./bootstrap --skip-po
    mkdir build && cd build
    ../configure --prefix=/usr
    make
}

check() {
    cd "$pkgname/build"
    make -k check
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
