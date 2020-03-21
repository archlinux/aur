# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder-git
pkgver=2.5.0.r4.g48ab194
pkgrel=1
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt5-base'
)
makedepends=(
    'qt5-tools'
)
conflicts=('pokefinder')
provides=('pokefinder')

source=(
    "$pkgname::git+https://github.com/Admiral-Fish/PokeFinder.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init

    qmake -config release PokeFinder.pro
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/$pkgname/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}
