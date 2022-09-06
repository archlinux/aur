# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=picsimlab
pkgver=0.8.11
pkgrel=1
pkgdesc="Programmable IC Simulator Laboratory"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/picsimlab"
license=('GPL2')
conflicts=('picsimlab-bin')
depends=('lxrad-git' 'simavr-picsimlab' 'picsim-git' 'ucsim-picsimlab' 'gpsim-cli')
optdepends=('cutecom' 'tty0tty')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8356329e877213b6581b02c9c4740dd3f9957697253af4ffb5eb609cebd4f16')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p "fakeinclude/fakeinclude"
    touch "fakeinclude/config.h"
}

build() {
    cd "$pkgname-$pkgver"
    make CXXFLAGS="-std=c++11 -I $PWD/fakeinclude/fakeinclude"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/usr" install_app
    cd "src"
    make DESTDIR="$pkgdir/usr" install_docs
}
